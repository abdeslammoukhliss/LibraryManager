import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/membre.dart';
import 'add_member_screen.dart';
import 'drawer_widget.dart';
import 'edit_member_screen.dart';
import 'member_detail_screen.dart';

class MembersScreen extends StatefulWidget {
  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  final List<Member> members = [
    Member(
      name: 'Member One',
      membershipId: 'ID001',
      imagePath: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
      description: 'Description of Member One.',
    ),
    Member(
      name: 'Member Two',
      membershipId: 'ID002',
      imagePath: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
      description: 'Description of Member Two.',
    ),
    // Ajoutez plus de membres ici
  ];

  void _addMember(Member member) {
    setState(() {
      members.add(member);
    });
  }
  void _deleteMember(int index) {
    setState(() {
      members.removeAt(index);
    });
  }

  void _editMember(int index, Member member) {
    setState(() {
      members[index] = member;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Adhérents'),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Card(
            child: ListTile(
              leading: Image.network(member.imagePath, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(member.name),
              subtitle: Text(member.membershipId),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberDetailScreen(member: member),
                  ),
                );
              },
              trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
              IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditMemberScreen(
                      member: member,
                      editMemberCallback: (editedMember) {
                        _editMember(index, editedMember);
                      },
                    ),
                  ),
                );
              },
            ),
                    IconButton(
                      icon: Icon(Icons.delete,color: Colors.red,),
                      onPressed: () {
                        _deleteMember(index);
                      },
                    ),
            ]
          ),
          ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMemberScreen(addMemberCallback: _addMember),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}