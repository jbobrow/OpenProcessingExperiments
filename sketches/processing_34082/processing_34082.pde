
int t = 0;
int x = 0;
int y=150;
int amplitude=50;
int opacity = 2;

void setup() {
 size(1000,300);
 background(0);
 stroke(255);
 line(0, height/2, width, height/2);
}

void draw() {
 t = millis()%31000;
 x = int(map(t,0,31000,0,width));

 if(mousePressed) {
   if(t<10000) {
     noStroke();
     fill(int(random(0,100)),150,150, opacity);
     rectMode(CENTER);
     rect(x,y,int(random(0,50)),int(random(0,amplitude)));
     amplitude++;
     opacity = constrain(opacity+1, 0,255);
   }
   else if ((t>=10000)&&(t<20000)) {
     noStroke();
     fill(150,150,int(random(0,100)), opacity);
     ellipse(x,y,int(random(0,50)),int(random(0,amplitude)));
     amplitude++;
     opacity = constrain(opacity+1, 0,255);
   }
   else if ((t>=20000)&&(t<30000)) {
     noStroke();
     fill(150,int(random(0,100)),150, opacity);
     rect(x,y,int(random(0,50)),int(random(0,amplitude)));
     amplitude++;
     opacity = constrain(opacity+1, 0,255);
   }
   else if ((t>=30000)&&(t<31000)) {
     background(0);
      stroke(255);
     line(0, height/2, width, height/2);
   }
 } else {
   amplitude=50;
   opacity=2;
 }
}

