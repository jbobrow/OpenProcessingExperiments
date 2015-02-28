
void setup (){
  size (600,600);
  smooth ();
  background (65,53,89);
  fill (100,200,255);
  stroke (255);
  for (int i=0; i<600;i+=15) {
    fill (33,20,38);
  ellipse (i,i,900,900);
    fill(65,53,89);
  ellipse (i,i,800,800);
    fill (101,110,139);
  ellipse (i,i,700,700);
    fill (156,191,171);
  ellipse (i,i,600,600);
    fill (242,239,222);
  ellipse(i,i,500,500);
    fill (156,191,171);
    ellipse(i,i,400,400);
    fill(101,110,139);
    ellipse (i,i,300,300);
    fill (65,53,89);
    ellipse(i,i,200,200);
  }
  noStroke();
 fill (55,55,55);
  ellipse (300,530, 250,100);
   beginShape ();//tail
  fill (198,1,81);
  stroke (0);
  strokeWeight(1);
  vertex(300,410); //begin
  vertex(400,460);//2
  vertex(430,440);//3
  vertex(470,480);//4
  vertex(490,470);//5
  vertex(470,485);//6
  vertex(430,450);//7
  vertex(400,470);//8
  vertex(300,420);//9
  endShape (CLOSE);
  noStroke ();
  fill (21,21,21);
   ellipse (300, 410, 150, 220); // body
  ellipse (226, 217, 100, 100); // ear left
  ellipse (374, 217, 100, 100); //ear right
  fill (55,55,55);
  ellipse (297,400, 150, 200); //body
  ellipse (226, 212, 98, 98);  // ear left
  ellipse (374, 212, 98, 98);  // ear right
  fill (89,89,89);
  stroke (50);
  strokeWeight (1);
  ellipse (296, 390, 150, 200);// body
  ellipse (226, 210,94,94);// ear left
  ellipse (374, 210,94,94);//ear right
fill (198,1,81);
    noStroke ();
  ellipse (240,220,60,60);//left pink
  ellipse (360,220,60,60);//right pink
  fill (21,21,21);
  ellipse (300, 254, 100, 100);// head
  fill (55,55,55);
  ellipse (300,252, 98, 98);// head
  fill (89,89,89);
  stroke (50);
  strokeWeight (1);
  ellipse (300, 250, 96, 96);// head
  fill ();
  stroke (0);
  strokeWeight (1);
     rect (294,260,5,10); //left tooth
     rect (300,260,5,10); //right tooth 
     noStroke();
     fill (0);
     int d = 300;
     int e = 255;
     int f = 400;
     int g = 200;
     int h = 256;
     quad (d,e,  f,260,  f,261,  d,h);//rwm
     quad (d,e,  g,260,  g,261,  d,h);//lwm
     quad (d,e  ,f,280,  f,281,  d,h); // rwb
     quad (d,e,  g,280,  g,281,  d,h); //lwb
     quad (d,e,  f,240,  f,241,  d,h); //rtw
     quad (d,e,  g,240,  g,241,  d,h); //ltw
  beginShape ();//nose
  fill(198,1,81);
 // fill (249,33,106);
  strokeWeight (1);
  stroke (0);
  ellipse (300,258,15,10);
  //vertex (285,252);
  //vertex (315,252);
  //vertex (300,266);
  //endShape (CLOSE);
  noStroke ();
  fill (0);
  ellipse (295,245,4,7); //left eye
  ellipse (305,245,4,7);// right eye
  fill (65,205,179); 
  noStroke();
  fill (255,0,70);
  int x = 35;
  int y = 30;
  int z = 20;
  int a = 330;
  int b = 29;
  int c = 520;
  stroke (0);
  strokeWeight (1);
  fill (50);
  ellipse (255,340,40,30);
  ellipse (342,340,40,30);
fill (198,1,81);
  ellipse (268,a,z,y);   // paw left
  ellipse (242,a,z,y);  
fill (249,33,106);
  ellipse (255,a,b,x);   
fill (198,1,81);
  ellipse (329,a,z,y);   //paw right
  ellipse (355,a,z,y);  
fill (249,33,106);
  ellipse (342,a,b,x);  
fill (198,1,81);
  ellipse (272,c,z,y);  //foot left
  ellipse (248,c,z,y);
fill (249,33,106);
  ellipse (260,c,b,x); 
fill (198,1,81);
  ellipse (325,c,z,y); //foot right
  ellipse (349,c,z,y);
fill (249,33,106);
  ellipse (337,c,b,x);
fill (55,55,55);
  noStroke ();
  ellipse (150,530,110,40);
  beginShape ();
  noStroke ();
  fill (255,204,0);
  vertex (150,430);
  vertex (200,530);
  vertex (100,530);
  endShape ();
  fill (100);
  noStroke (0);
  strokeWeight (1);
  ellipse (150,460,10,10);
  ellipse (135,500,30,30);
  ellipse (160,480,20,20);
  ellipse (170,510,15,15);
  fill (50);
  ellipse (150,460,5,5);
  ellipse (135,500,25,25);
  ellipse (160,480,16,16);
  ellipse (170,510,10,10);
}



