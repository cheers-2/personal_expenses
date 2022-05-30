import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAMount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAMount, this.spendingPctOfTotal,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* LayoutBuilder memiliki 2 parameter ctx dan constraint,
    //* parameter constraint memiliki maxHeight dari parent main.dart pada saat memanggil ChartBar
    return LayoutBuilder(
      builder: (ctx, constraint) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(
                child: Text('\$${spendingAMount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(height: constraint.maxHeight * 0.05),
            SizedBox(
              height: constraint.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraint.maxHeight * 0.05),
            SizedBox(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
