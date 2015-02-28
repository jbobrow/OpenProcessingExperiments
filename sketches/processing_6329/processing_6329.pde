
/**Matrix
 *
 *Created By: David A. Perez
 */
 
 PFont a;
 float y;
 
 void setup(){
   background(0);
   frameRate(20);
   size(800,900);
   a = loadFont("ArialMT-48.vlw");
   textFont(a, 10);
   y=0;
 }
 
 void draw(){
   fill(0, 25);
   rect(0,0, width, height);
   matrix();
 }

 void matrix(){
   float c;
   if(y-500>height){y = 0;}
   for(int j=0; j < 50; j++){
     for(int i=0; i<width/10; i++){
       if((i>=29 && i<=34 && j<=42 && j>=25) || (i>=47 && i<=52 && j<=42 && j>=25)||
          (i>=15 && i<=20 && j<=25 && j>=20) || (i>=20 && i<=25 && j<=20 && j>=15)||
          (i>=25 && i<=56 && j<=15 && j>=10) || (i>=56 && i<=61 && j<=20 && j>=15)||
          (i>=61 && i<=66 && j<=25 && j>=20)){fill(0,50);
                                              rect(i*10,y-j*10, 10, 10);
                                              c = 10;}
       else{c = random(30);}
       
       fill(20,160,20);       
       if(c < 4){text("0", i*10, y-j*10);}
       else if(c>3 && c<9){text("1", i*10, y-j*10);} 
       else{text("", i*10, y-j*50);}    
       y=y+0.005;
     }
   }
 }

