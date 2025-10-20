import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transacoes = [
      {'valor': 50.0, 'categoria': 'Alimentação', 'data': '12/10', 'tipo': 'despesa'},
      {'valor': 120.0, 'categoria': 'Lazer', 'data': '11/10', 'tipo': 'despesa'},
      {'valor': 800.0, 'categoria': 'Salário', 'data': '10/10', 'tipo': 'receita'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transações'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/transaction_form'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: transacoes.length,
        itemBuilder: (context, index) {
          final t = transacoes[index];
          final color = t['tipo'] == 'despesa' ? Colors.red : Colors.green;
          final tipoIcon = t['tipo'] == 'despesa'
              ? Icons.arrow_upward
              : Icons.arrow_downward;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(tipoIcon, color: color),
              title: Text(
                NumberFormat.simpleCurrency(locale: 'pt_BR')
                    .format(t['valor']),
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${t['categoria']} • ${t['data']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Botão editar ✏️
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Editar transação: ${t['categoria']} (mock)'),
                        ),
                      );
                    },
                  ),
                  // Botão excluir 🗑️
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Transação excluída: ${t['categoria']} (mock)'),
                        ),
                      );
                    },
                  ),
                ],
              ),
              onTap: () =>
                  Navigator.pushNamed(context, '/transaction_detail'),
            ),
          );
        },
      ),
    );
  }
}
