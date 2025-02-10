import 'package:flutter/material.dart';

class WeightAgeContainer extends StatefulWidget {
  String name;
  int value;
   WeightAgeContainer({super.key,required this.value,required this.name});

  @override
  State<WeightAgeContainer> createState() => _WeightAgeContainerState();
}

class _WeightAgeContainerState extends State<WeightAgeContainer> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 180,
      width: MediaQuery.sizeOf(context).width * 0.42,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 31, 29, 29),
          borderRadius: BorderRadius.circular(14)),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
           Text(widget.name,
              style:const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Text('${widget.value}', style: const TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey,
                child: IconButton(onPressed: (){
                  setState(() {
                    widget.value++;
                  });
                }, icon: const Icon(Icons.add,color: Colors.white,size: 34,)),
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey,
                child: IconButton(onPressed: (){
                  setState(() {
                    widget.value--;
                  });
                }, icon: const Icon(Icons.remove_sharp,color: Colors.white,size: 34,)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
