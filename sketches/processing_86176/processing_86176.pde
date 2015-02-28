
void setup () {
  size (600, 600);
  smooth ();
  background (0,255,150);
  noStroke ();
  fill (49,190,80);
  rect (0,0,450,450);
  fill (28,219,70);
  rect (0,0,300,300);
  fill (0,255,25);
  rect (0,0,200,200);
    fill (15);
  ellipse (300,530, 250,100);
   beginShape ();//tail
  fill (255,0,70);
  stroke (0);
  strokeWeight(1);
  vertex(300,400); //begin
  vertex(400,450);//2
  vertex(430,430);//3
  vertex(470,470);//4
  vertex(490,470);//5
  vertex(470,480);//6
  vertex(430,450);//7
  vertex(400,470);//8
  vertex(300,420);//9
  endShape ();
  noStroke ();
  fill (0);
   ellipse (300, 400, 180, 260); // body
  ellipse (210, 160, 115, 117); // ear left
  ellipse (390, 160, 115, 117); //ear right
  fill (50);
  ellipse (297,390, 178, 240); //body
  ellipse (207, 158, 113, 113);  // ear left
  ellipse (387, 158, 113, 113);  // ear right
  fill (100);
  stroke (50);
  strokeWeight (1);
  ellipse (296, 380, 176, 230);// body
  ellipse (204, 156,111, 111);// ear left
  ellipse (384, 156,111,111);//ear right
   fill (240,0,70);
    noStroke ();
  ellipse (210,160,75,75);
  ellipse (390,160,75,75);
  fill (0);
  ellipse (300, 220, 130, 130);// head
  fill (50);
  ellipse (297,217, 128, 128);// head
  fill (100);
  stroke (50);
  strokeWeight (1);
  ellipse (297, 213, 126, 126);// head
  fill ();
  stroke (0);
  strokeWeight (1);
     rect (294,242,5,11); //left tooth
     rect (300,242,5,11); //right tooth 
     noStroke();
     fill (0);
     int d = 300;
     int e = 234;
     int f = 400;
     int g = 200;
     int h =235;
     quad (d,e,f,250,f,251,d,h);//rwm
     quad (d,e,g,250,g,251,d,h);//lwm
     quad (d,e,f,270,f,271,d,h); // rwb
     quad (d,e,g,270,g,271,d,h); //lwb
     quad (d,e,f,230,f,231,d,h); //rtw
     quad (d,e,g,230,g,231,d,h); //ltw
  beginShape ();//nose
  fill (255,0,70);
  strokeWeight (1);
  stroke (0);
  vertex (285, 234);
  vertex (315, 234);
  vertex (300, 250);
  endShape (CLOSE);
  noStroke ();
  fill (0);
  ellipse (295,240,3,6); //left nostril
  ellipse (305,240,3,6);// right nostril
  fill (0,255,25); 
  stroke (0);
  strokeWeight (1);
  ellipse (288,220,10,15);// left eye
  ellipse (312,220,10,15);// right eye
  noStroke();
 fill (0);
ellipse (288,220,7,13);
ellipse (312,220,7,13);
  fill();
  ellipse (289,217,5,5); // left eye shine
  ellipse (313,217,5,5); // right eye shine
  fill (255,0,70);
  int x = 45;
  int y = 40;
  int z = 30;
  int a = 330;
  int b = 35;
  int c = 520;
  stroke (0);
  strokeWeight (1);
  fill (50);
  ellipse (255,340,50,40);
  ellipse (342,340,50,40);
  fill (255,0,70);
  ellipse (265,a,z,y);   // paw left
  ellipse (245,a,z,y);  
  ellipse (255,a,b,x);   
  ellipse (332,a,z,y);   //paw right
  ellipse (352,a,z,y);  
  ellipse (342,a,b,x);  
  ellipse (260,c,z,y);  //foot left
  ellipse (240,c,z,y);
  ellipse (250,c,b,x); 
  ellipse (337,c,z,y); //foot right
  ellipse (357,c,z,y);
  ellipse (347,c,b,x);
  fill (15);
  noStroke ();
  ellipse (150,530,120,50);
  beginShape ();
  noStroke ();
  fill (255,255,0);
  vertex (150,430);
  vertex (200,530);
  vertex (100,530);
  endShape (CLOSE);
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
 


