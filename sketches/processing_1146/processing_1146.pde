
size (400,400);
background (0);

int [ ] rayo = new int [50];

for (int i = 0; i < 50; i++){
  int estrella = int (random(400,-130));
  rayo [i] = estrella;
  
 for  (int f = 0; f < 100; f++){
  line(-200 + estrella,-200 + estrella,int(random(10,390)),int(random(0,390)));
  
    stroke(random(0,20),random(50,255), random(180,240),random(0,255));
 }
}

