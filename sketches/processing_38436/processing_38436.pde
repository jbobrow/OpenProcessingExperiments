
void setup(){
  size(500,500);
  background(240,230,180);
  
  for( int a=0; a<=width; a+=random(1,3)){
    for( int b=0; b<=height; b+=random(1,3)){
      stroke(220,210,160);
      point(a,b);  }}
      
  for( int a=0; a<=width; a+=random(1,3)){
    for( int b=0; b<=height; b+=random(1,3)){
      point(b,a);  }}
  // horizontal lines for top rectangle
  for( int a=25; a<=475; a+=random(1,3)){
    stroke(30);
    point(a,25);
    point(a,75);  }
  //vertical lines for top rectangle
  for( int b=25; b<=75; b+=random(1,3)){
    point(25,b);
    point(475,b);  }
  }


void draw(){
}



void mousePressed(){ 
  
  stroke(1);
  
  float sw = random(1,3);
  
  background(240,230,180);
  
  for( int a=0; a<=width; a+=random(1,3)){
    for( int b=0; b<=height; b+=random(1,3)){
      stroke(220,210,160);
      point(a,b);  }}
      
  for( int a=0; a<=width; a+=random(1,3)){
    for( int b=0; b<=height; b+=random(1,3)){
      point(b,a);  }}
  // horizontal lines for top rectangle
  for( int a=25; a<=475; a+=random(1,3)){
    stroke(30);
    point(a,25);
    point(a,75);  }
  //vertical lines for top rectangle
  for( int b=25; b<=75; b+=random(1,3)){
    point(25,b);
    point(475,b);  }
  //horizontal dividing line for the rectangle
  for( int d=25; d<=475; d+=random(1,3)){
    strokeWeight(random(0,1));
    point(d,50);
    point(d,63);
    point(d,37);  }
  //vertical dividing lines for rectangle
  for( int d=25; d<=475; d+=18){
    for( int e=25; e<=75; e+=random(1,3)){
      point(d,e);  }}
  
  //assigns the y values of the points as a letter
  //1
  float a=(random(25,75));
  //2
  float b=(random(25,75));
  //3
  float c=(random(25,75));
  //4
  float d=(random(25,75));
  //5
  float e=(random(25,75));
  //6
  float f=(random(25,75));
  //7
  float g=(random(25,75));
  //8
  float h=(random(25,75));
  //9
  float i=(random(25,75));
  //10
  float j=(random(25,75));
  //11
  float k=(random(25,75));
  //12
  float l=(random(25,75));
  //13
  float m=(random(25,75));
  //14
  float n=(random(25,75));
  //15
  float o=(random(25,75));
  //16
  float p=(random(25,75));
  //17
  float q=(random(25,75));
  //18
  float r=(random(25,75));
  //19
  float s=(random(25,75));
  //20
  float t=(random(25,75));
  //21
  float u=(random(25,75));
  //22
  float v=(random(25,75));
  //23
  float w=(random(25,75));
  //24
  float x=(random(25,75));
   
      
  //random points that generate drawing
  strokeWeight(3);
  //1
  point(43,a);
  //2
  point(61,b);
  //3
  point(79,c);
  //4
  point(97,d);
  //5
  point(115,e);
  //6
  point(133,f);
  //7
  point(151,g);
  //8
  point(169,h);
   //9
  point(187,i);
  //10
  point(205,j);
  //11
  point(223,k);
  //12
  point(241,l);
  //13
  point(259,m);
  //14
  point(277,n);
  //15
  point(295,o);
  //16
  point(313,p);
  //17
  point(331,q);
  //18
  point(349,r);
  //19
  point(367,s);
  //20
  point(385,t);
  //21
  point(403,u);
  //22
  point(421,v);
  //23
  point(439,w);
  //24
  point(457,x);
  
  
  //line 1
  if (a<50){
    stroke(30);
    strokeWeight(sw);
    line(75,random(250,300),75,random(350,450));
  }
  if (a>50){
    strokeWeight(sw);
    line(25,400,random(50,100),400);
  }
  //line 2
  if (b<50){
    stroke(30);
    strokeWeight(1);
    line(95,random(250,275),95,random(300,450));
  }
  if (b>50){
    strokeWeight(1);
    line(random(50,200),350,random(350,450),350);
  }
  //line 3
  if (c<50){
    stroke(30);
    strokeWeight(1);
    line(115,random(250,275),115,random(350,450));
  }
  if (c>50){
    strokeWeight(1);
    line(random(100,200),355,random(300,450),355);
  }
  //line 4
  if (d<50){
    stroke(30);
    strokeWeight(1);
    line(135,random(350,375),135,random(400,450));
  }
  if (d>50){
    strokeWeight(1);
    line(random(100,200),375,random(300,400),375);
  }
  //line 5
  if (e<50){
    stroke(30);
    strokeWeight(1);
    line(155,random(300,350),155,random(400,450));
  }
  if (e>50){
    strokeWeight(sw);
    line(25,425,random(50,100),425);
  }
  //line 6
  if (f<50){
    stroke(30);
    strokeWeight(1);
    line(185,random(250,275),185,random(300,450));
  }
  if (f>50){
    strokeWeight(sw);
    line(random(50,200),375,random(350,450),375);
  }
  //line 3
  if (g<50){
    stroke(30);
    strokeWeight(1);
    line(225,random(250,275),225,random(350,450));
  }
  if (g>50){
    strokeWeight(1);
    line(random(100,200),385,random(300,450),385);
  }
  //line 4
  if (h<50){
    stroke(30);
    strokeWeight(1);
    line(235,random(350,375),235,random(400,450));
  }
  if (h>50){
    strokeWeight(1);
    line(random(100,200),405,random(300,400),405);
  }
  if (i<50){
    stroke(30);
    strokeWeight(1);
    line(240,random(250,300),240,random(350,450));
  }
  if (i>50){
    strokeWeight(1);
    line(25,410,random(50,100),410);
  }
  //line 2
  if (l<50){
    stroke(30);
    strokeWeight(1);
    line(305,random(250,275),305,random(300,450));
  }
  if (l>50){
    strokeWeight(1);
    line(random(50,200),435,random(350,450),435);
  }
  //line 3
  if (m<50){
    stroke(30);
    strokeWeight(sw);
    line(315,random(250,275),315,random(350,450));
  }
  if (m>50){
    strokeWeight(1);
    line(random(100,200),275,random(300,450),275);
  }
  //line 4
  if (n<50){
    stroke(30);
    strokeWeight(1);
    line(400,random(350,375),400,random(400,450));
  }
  if (n>50){
    strokeWeight(1);
    line(random(100,200),280,random(300,400),280);
  }
 if (o<50){
    stroke(30);
    strokeWeight(1);
    line(415,random(250,300),415,random(350,450));
  }
  if (o>50){
    strokeWeight(1);
    line(25,282,random(50,100),282);
  }
  //line 2
  if (p<50){
    stroke(30);
    strokeWeight(1);
    line(425,random(250,275),425,random(300,450));
  }
  if (p>50){
    strokeWeight(1);
    line(random(50,200),295,random(350,450),295);
  }
  //line 3
  if (q<50){
    stroke(30);
    strokeWeight(1);
    line(435,random(250,275),435,random(350,450));
  }
  if (q>50){
    strokeWeight(1);
    line(random(100,200),435,random(300,450),435);
  }
  //line 4
  if (r<50){
    stroke(30);
    strokeWeight(1);
    line(450,random(350,375),450,random(400,450));
  }
  if (r>50){
    strokeWeight(1);
    line(random(100,200),440,random(300,400),440);
  }
  //line 1
  if (s<50){
    stroke(30);
    strokeWeight(1);
    line(455,random(250,300),455,random(350,450));
  }
  if (s>50){
    strokeWeight(1);
    line(25,330,random(50,100),330);
  }
  //line 2
  if (t<50){
    stroke(30);
    strokeWeight(1);
    line(250,random(250,275),250,random(300,450));
  }
  if (t>50){
    strokeWeight(1);
    line(random(50,200),332,random(350,450),332);
  }
  //line 3
  if (u<50){
    stroke(30);
    strokeWeight(1);
    line(252,random(250,275),252,random(350,450));
  }
  if (u>50){
    strokeWeight(1);
    line(random(100,200),250,random(300,450),250);
  }
  //line 4
  if (v<50){
    stroke(30);
    strokeWeight(sw);
    line(250,random(350,375),250,random(400,450));
  }
  if (v>50){
    strokeWeight(1);
    line(random(100,200),255,random(400,425),255);
  }
  //line 1
  if (w<50){
    stroke(30);
    strokeWeight(1);
    line(300,random(250,300),300,random(350,450));
  }
  if (w>50){
    strokeWeight(1);
    line(25,260,random(50,250),260);
  }
  //line 2
  if (x<50){
    stroke(30);
    strokeWeight(1);
    line(350,random(250,275),350,random(300,450));
  }
  if (x>50){
    strokeWeight(1);
    line(random(25,100),265,random(350,450),265);
  }
}

 
  
  
  
  
  
  
  
  
  
  
  
  
  


