
//plaid//


size(500,500);
background (139,216,207);//blue backgound//

strokeWeight(10);//pinklines//
stroke(200,23,126);
for (int x=0; x<=500; x+=20) {
  line (0,x,500,x);
}
strokeWeight (20); //greenlines set 1//
stroke(20,190,60);
for (int x=0; x<=100; x+=50) {
  line (x,0,x,500);
}

strokeWeight (20); //greenlines set 2//
stroke(20,190,60);
for (int x=300; x<=500; x+=50) {
  line (x,0,x,500);
}



strokeWeight(35);//pinklines//
stroke(190,190,0);
for (int x=0; x<=500; x+=100) {
  line (0,x,500,x);
}

