


float getVolume(LinkedList myList){
PVector A = (PVector)myList.get(0);
PVector B = (PVector)myList.get(1);
PVector C = (PVector)myList.get(2);
PVector D = (PVector)myList.get(3);
float V1 = -0.5*(A.y - B.y)*B.x;
float V2 = -0.5*(C.y - D.y)*C.x;
float V3 = 0.5*(C.y - B.y)*(C.x + B.x);
//println(V1+" "+V2+" "+V3 +" "+(V1+V2+V3));
return V1+V2+V3;
}

