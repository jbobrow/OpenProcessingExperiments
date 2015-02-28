
size(200, 200);
background(224, 216, 52);

for (int a=20; a<=250; a=a+50) //*variação vertical.
{ 
 stroke(78, 168, 234, 90);
 strokeWeight(5);
 line(10, 10, 80, a*a/100+50); //*ladoesquerdo

 line(190, 10, 120, a*a/100+50);//*ladodireito
}
