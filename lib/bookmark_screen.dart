import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'global_vars.dart';
import 'package:share/share.dart';

class BookMarks extends StatefulWidget {
  const BookMarks({super.key});

  @override
  State<BookMarks> createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Text("Favorite Quotes",style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: quotes.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: ListTile(
                      title: Text(quotes[index].toString(),style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(1)
                      ),),
                      subtitle: Text('∽ ${authors[index].toString()}',style: const TextStyle(
                        fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18
                      ),),
                      trailing: Column(
                        children: [
                          GestureDetector(
                             onTap: (){
                               Share.share('"${quotes[index].toString()}"\n∽ ${authors[index].toString()}');
                             },
                               child: const Icon(Icons.share_outlined,color: Colors.black,size: 26,)
                           ),
                          const SizedBox(height: 4,),
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  quotes.removeAt(index);
                                  authors.removeAt(index);
                                });
                              },
                              child: const Icon(Icons.delete,color: Colors.black,size: 26,)
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}
