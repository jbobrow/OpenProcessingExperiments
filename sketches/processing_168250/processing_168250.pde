
//Markús S.
size(400,400);
background(255);
stroke(0);
noFill();

//for (int i = 0; i < width; i++){
//rect(0,i,i,i*2);
//}
for (int a = 200; a > -1; a= a-1){
   rect(a*2,a,a,a);
}
for (int a = 200; a > -1; a= a-1){
   rect(a,a*2,a,a);
}
for (int a = 450; a > -1; a= a-1){
   rect(a,a,a/5,a/5);
}
for (int a = 200; a > -1; a= a-1){
   rect(a,a*2.8,a,a);
}
for (int a = 200; a > -1; a= a-1){
   rect(a*2.8,a,a,a);
}
