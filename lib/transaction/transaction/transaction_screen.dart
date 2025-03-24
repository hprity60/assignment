import 'package:assignment/transaction/transaction/transaction_model.dart';
import 'package:flutter/material.dart';

import 'dummy_data.dart';

class TransactionScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const TransactionScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.isDarkMode ? Color(0xFF000000) : Color(0xFFffffff)),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/top.png',
              fit: BoxFit.cover,
              height: 170,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    // Wallet Cards
                    Row(
                      children: [
                        Expanded(
                          child: _buildWalletCard(
                            currency: "€",
                            amount: "0.00",
                            currencyName: "Euro",
                            isDarkMode: widget.isDarkMode,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildWalletCard(
                            currency: "\$",
                            amount: "0.00",
                            currencyName: "US Dollar",
                            isDarkMode: widget.isDarkMode,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildAddWalletCard(widget.isDarkMode),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Credit Score Section
                    Text(
                      "Efectivo score",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color:
                            widget.isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildCreditScoreCard(widget.isDarkMode),

                    const SizedBox(height: 24),

                    // Last Activity Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Last Activity",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: widget.isDarkMode
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: widget.isDarkMode
                              ? Colors.white54
                              : Colors.black54,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Transactions List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        return _buildTransactionItem(
                          transactions[index],
                          widget.isDarkMode,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Bar
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color:
                    widget.isDarkMode ? const Color(0xFF1E2229) : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavBarItem(
                      icon: Icons.home,
                      label: "HOME",
                      isActive: true,
                      isDarkMode: widget.isDarkMode,
                    ),
                    _buildNavBarItem(
                      icon: Icons.group,
                      label: "CIRCLES",
                      isActive: false,
                      isDarkMode: widget.isDarkMode,
                    ),
                    _buildNavBarItem(
                      icon: Icons.notifications,
                      label: "NOTIFICATION",
                      isActive: false,
                      isDarkMode: widget.isDarkMode,
                    ),
                    InkWell(
                      onTap: widget.toggleTheme,
                      child: _buildNavBarItem(
                        icon: Icons.settings,
                        label: "SETTINGS",
                        isActive: false,
                        isDarkMode: widget.isDarkMode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletCard({
    required String currency,
    required String amount,
    required String currencyName,
    required bool isDarkMode,
  }) {
    return Card(
      color: isDarkMode ? const Color(0xFF1E2229) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? Colors.black.withOpacity(0.3)
                      : Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    currency,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.green : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.green : Colors.black87,
              ),
            ),
            Text(
              currencyName,
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.white54 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddWalletCard(bool isDarkMode) {
    return Card(
      color: isDarkMode ? const Color(0xFF1E2229) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isDarkMode ? Colors.green : Colors.blue,
                  width: 1,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: isDarkMode ? Colors.green : Colors.blue,
                size: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Open New\nWallet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditScoreCard(bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1E2229) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 11,
              spreadRadius: 0,
              color: const Color(0xFF898989).withOpacity(.25),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Credit Score Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            colors: [Colors.red, Colors.orange],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            colors: [Colors.lightGreen, Colors.green],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Credit Score Labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Very Poor",
                  style: TextStyle(
                    fontSize: 10,
                    color: isDarkMode ? Colors.white54 : Colors.grey,
                  ),
                ),
                Text(
                  "Poor",
                  style: TextStyle(
                    fontSize: 10,
                    color: isDarkMode ? Colors.white54 : Colors.grey,
                  ),
                ),
                Text(
                  "Fair",
                  style: TextStyle(
                    fontSize: 10,
                    color: isDarkMode ? Colors.white54 : Colors.grey,
                  ),
                ),
                Text(
                  "Good",
                  style: TextStyle(
                    fontSize: 10,
                    color: isDarkMode ? Colors.white54 : Colors.grey,
                  ),
                ),
                Text(
                  "Excellent",
                  style: TextStyle(
                    fontSize: 10,
                    color: isDarkMode ? Colors.white54 : Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            // Credit Score Indicator
            Align(
              alignment:
                  const Alignment(0.8, 0), // Position at "Good" to "Excellent"
              child: Icon(
                Icons.arrow_drop_up,
                color: isDarkMode ? Colors.green : Colors.blue,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(Transaction transaction, bool isDarkMode) {
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor = isDarkMode ? Colors.white54 : Colors.black54;
    final amountValue = transaction.amount.abs().toStringAsFixed(2);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1E2229) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 11,
              spreadRadius: 0,
              color: const Color(0xFF898989).withOpacity(.25),
            )
          ]),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black38 : Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                Icons.description_outlined,
                color: isDarkMode ? Colors.green : const Color(0xFF42B7C6),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
                Text(
                  transaction.isSent ? "Sent" : "Received",
                  style: TextStyle(
                    fontSize: 12,
                    color: subTextColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                transaction.amount > 0
                    ? "+$amountValue USD"
                    : "-$amountValue USD",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: transaction.amount > 0 ? Colors.green : Colors.red,
                ),
              ),
              Text(
                transaction.date,
                style: TextStyle(
                  fontSize: 12,
                  color: subTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required bool isDarkMode,
  }) {
    final color = isActive
        ? (isDarkMode ? Colors.green : Colors.blue)
        : (isDarkMode ? Colors.white54 : Colors.black54);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: color,
          ),
        ),
      ],
    );
  }
}
