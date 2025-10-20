import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double saldo = 520.75;
    final categorias = [
      {'nome': 'Alimentação', 'total': 150.0},
      {'nome': 'Transporte', 'total': 80.0},
      {'nome': 'Lazer', 'total': 120.0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.category),
            onPressed: () => Navigator.pushNamed(context, '/categories'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Resumo do mês',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.indigo.shade50,
              child: ListTile(
                title: const Text('Saldo disponível'),
                subtitle: Text(
                  NumberFormat.simpleCurrency(locale: 'pt_BR').format(saldo),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Gastos por categoria',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...categorias.map(
              (cat) => Card(
                child: ListTile(
                  title: Text(cat['nome'] as String),
                  trailing: Text(
                    NumberFormat.simpleCurrency(locale: 'pt_BR')
                        .format(cat['total']),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.list),
              label: const Text('Ver transações'),
              onPressed: () => Navigator.pushNamed(context, '/transactions'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Nova transação'),
              onPressed: () => Navigator.pushNamed(context, '/transaction_form'),
            ),
          ],
        ),
      ),
    );
  }
}
