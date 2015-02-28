
void setup(){
  size (900,900);
  background (40,40,40);
  smooth ();
  
  
  
//MONKEY #1 = papa
  int x = 190; // ctr of x axis for 1st monkey
  int y = 460; // height/2 = y ctr
  int aw = 50; // arm width
  int hd = 130; // head width  
  
  noStroke();
  
  //cape
  fill (70,100,165);
  quad (x-50, y-70, x+50, y-70, x+140, y+123, x-140, y+123);
  bezier (x+140, y+123, x+40, y+170, x-40, y+170, x-140, y+123);
  
  
  //body
  noStroke ();
  fill (144,116,74);
  ellipse (x, y, hd+10, hd*1.6);
  
 // left arm
  stroke (144,116,74);
  strokeCap(ROUND);
  strokeWeight (36);
  line(x-40, y-70, x-175, y+30);
  stroke (245,230,200);
  line (x-175, y+30, x-130, y-3);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (x-40, y-70, x-130, y-3);
  
  //right arm
  stroke (144,116,74);
  strokeCap(ROUND);
  strokeWeight (36);
  line(x+40, y-70, x+175, y+30);
  stroke (245,230,200);
  line (x+175, y+30, x+130, y-3);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (x+40, y-70, x+130, y-3);
  
  
  //left leg
  strokeCap (ROUND);
  strokeWeight (40);
  line (x-45, y+73, x-45, y+270);
  stroke (245,230,200);
  line (x-45, y+270, x-45, y+200);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (x-45, y+73, x-45, y+200);
  
  //right leg
  strokeCap(ROUND);
  strokeWeight (40);
  line (x+45, y+73, x+45, y+270);
  stroke (245,230,200);
  line (x+45, y+270, x+45, y+200);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (x+45, y+73, x+45, y+200);
  
  
 //monkey head
  noStroke();
  fill (144,116,74);
  arc (x,y-160,hd+15,hd+30, 0, TWO_PI ); 
  
  //hat
  fill (250,240,220);
  arc (x,y-200,hd,hd-20,PI, TWO_PI);
  
  //BALL on hat
  fill (70,100,165);
  ellipse (x, y-260, aw, aw-10);
  
  //rim of hat
  stroke(220,220,220);
  strokeWeight (13);
  strokeCap(ROUND);
  line(x-70,y-195,x+70,y-195);
  
  // ears
  noStroke();
  fill(144,116,74);
  ellipse (x-65,y-150,aw+20,aw); //left
  ellipse (x+65,y-150,aw+20,aw); // right
  fill (245,230,200);
  arc (x-72, y-150, aw-15, aw-20, PI/2, PI+HALF_PI);
  arc (x+72, y-150, aw-15, aw-20, -PI+PI/2, PI/2);
  
  //eyes
  fill (70,50,20);
  ellipse (x-14, y-165, aw/4,aw/4); //left
  ellipse (x+14, y-165, aw/4,aw/4); // right
  
  //mouth
  fill (245,230,200);
  ellipse (x, y-120, hd-20,hd/2.1);
  fill (210, 60, 60);
  arc (x, y-125, hd-38, hd/2.2, 0, PI);
    
  //cape tie
  fill (70,100,165);
  triangle (x, y-80, x-37, y-92, x-40, y-84);
  triangle (x, y-80, x+37, y-92, x+40, y-84);
  ellipse (x, y-80, 15, 12);
  
  
  //nostrils
  stroke (70,50,20);
  strokeWeight (3);
  line (x-6, y-140, x-7, y-137);
  line (x+6, y-140, x+7, y-137);
  
  
  
//MONKEY #2 = last monkey (skinny)
  int a = 710; // ctr of x axis for 1st monkey
  int b = 460; // height/2 = y ctr
  int c = 30; // arm width
  int d = 130; // head width  
  noStroke();
  
 //cape
  fill (210, 67, 67);
  quad (a-50, b-70, a+50, b-70, a+140, b+123, a-140, b+123);
  bezier (a+140, b+123, a+40, b+170, a-40, b+170, a-140, b+123);
  
  //body
  noStroke ();
  fill (175,147,104);
  ellipse (a, b, d, d*1.6);
  
 // left arm
  stroke (175,147,104);
  strokeCap(ROUND);
  strokeWeight (30);
  line(a-40, b-70, a-175, b+30);
  stroke (245,230,200);
  line (a-175, b+30, a-130, b-3);
  stroke (175,147,104);
  strokeCap(SQUARE);
  line (a-40, b-70, a-130, b-3);
  
  //right arm
  stroke (175,147,104);
  strokeCap(ROUND);
  strokeWeight (30);
  line(a+40, b-70, a+175, b+30);
  stroke (245,230,200);
  line (a+175, b+30, a+130, b-3);
  stroke (175,147,104);
  strokeCap(SQUARE);
  line (a+40, b-70, a+130, b-3);
  
  //left leg
  strokeCap (ROUND);
  strokeWeight (33);
  line (a-45, b+73, a-45, b+270);
  stroke (245,230,200);
  line (a-45, b+270, a-45, b+200);
  stroke (175,147,104);
  strokeCap(SQUARE);
  line (a-45, b+73, a-45, b+200);
  
  //right leg
  strokeCap(ROUND);
  strokeWeight (33);
  line (a+45, b+73, a+45, b+270);
  stroke (245,230,200);
  line (a+45, b+270, a+45, b+200);
  stroke (175,147,104);
  strokeCap(SQUARE);
  line (a+45, b+73, a+45, b+200);
  
  
 //monkey head
  noStroke();
  fill (175,147, 104);
  arc (a,b-160,d+15,d+30, 0, TWO_PI ); 
  
  //hat
  fill (240,225,200);
  arc (a,b-200,d,d-20,PI, TWO_PI);
  
  //BALL on hat
  fill (210, 67, 67);
  ellipse (a, b-260, c+10, c);
  
  //rim of hat
  stroke(220,220,220);
  strokeWeight (13);
  strokeCap(ROUND);
  line(a-70,b-195,a+70,b-195);
  
  // ears
  noStroke();
  fill(175,147,104);
  ellipse (a-65,b-150,c+20,c+20); //left
  ellipse (a+65,b-150,c+20,c+20); // right
  fill (245,230,200);
  arc (a-72, b-150, c-10, c-4, PI/2, PI+HALF_PI);
  arc (a+72, b-150, c-10, c-4, -PI+PI/2, PI/2);
  
  //eyes
  fill (70,50,20);
  ellipse (a-14, b-165, c/3,c/3); //left
  ellipse (a+14, b-165, c/3,c/3); // right
  
  //mouth
  fill (245,230,200);
  ellipse (a, b-120, d-20,d/2.1);
  fill (210, 60, 60);
  arc (a, b-125, d-38, d/2.2, 0, PI);
  
   //cape tie
  fill (210, 67, 67);
  triangle (a, b-80, a-37, b-92, a-40, b-84);
  triangle (a, b-80, a+37, b-92, a+40, b-84);
  ellipse (a, b-80, 15, 12);
  
  //nostrils
  stroke (70,50,20);
  strokeWeight (3);
  line (a-6, b-140, a-7, b-137);
  line (a+6, b-140, a+7, b-137);
  
  
 //MONKEY #2 = 2nd monkey
  int i = 450; // ctr of x axis for 1st monkey
  int j = 160; // height/2 = y ctr
  int k = 30-10; // arm width
  int l = 130-40; // head width  
  noStroke();
  
 //cape
  fill (90, 170, 80);
  quad (i-30, j, i+30, j, i+100, j+130, i-100, j+130);
  bezier (i+100, j+130, i+30, j+160, i-30, j+160, i-100, j+130);
  
  //body
  noStroke ();
  fill (144,116,74);
  ellipse (i, j+65, l*1.2, l*1.6);
  
 // left arm
  stroke (144,116,74);
  strokeCap(ROUND);
  strokeWeight (25);
  line(i-40, j+20, i-130, j-35);
  stroke (245,230,200);
  line (i-130, j-35, i-110, j-22);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (i-110, j-22, i-40, j+20);
  
  //right arm
  stroke (144,116,74);
  strokeCap(ROUND);
  strokeWeight (25);
  line(i+40, j+20, i+130, j-35);
  stroke (245,230,200);
  line (i+130, j-35, i+110, j-22);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (i+110, j-22, i+40, j+20);
  
  //left leg
  strokeCap (ROUND);
  strokeWeight (27);
  line (i-35, j+125, i-35, j+270);
  stroke (245,230,200);
  line (i-35, j+270, i-35, j+150);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (i-35, j+125, i-35, j+225);
  
  //right leg
  strokeCap (ROUND);
  strokeWeight (27);
  line (i+35, j+125, i+35, j+270);
  stroke (245,230,200);
  line (i+35, j+270, i+35, j+150);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (i+35, j+125, i+35, j+225);
  
  
 //monkey head
  noStroke();
  fill (144,116,74);
  arc (i,j-45,l+15,l+30, 0, TWO_PI ); 
  
  //hat
  fill (240,225,200);
  arc (i,j-65,l+5,l-10,PI, TWO_PI);
  
  //BALL on hat
  fill (90, 170, 80);
  ellipse (i, j-110, k+10, k);
  
  //rim of hat
  stroke(90, 170, 80);
  strokeWeight (8);
  strokeCap(ROUND);
  line(i-48,j-65,i+48,j-65);
  
  // ears
  noStroke();
  fill(144,116,74);
  ellipse (i-50,j-35,k+20,k+20); //left
  ellipse (i+50,j-35,k+20,k+20); // right
  fill (245,230,200);
  arc (i-50, j-35, k-5, k-4, PI/2, PI+HALF_PI);
  arc (i+50, j-35, k-5, k-4, -PI+PI/2, PI/2);
  
  //eyes
  fill (70,50,20);
  ellipse (i-14, j-45, k/2.5,k/2.5); //left
  ellipse (i+14, j-45, k/2.5,k/2.5); // right
  
  //mouth
  fill (245,230,200);
  ellipse (i, j-12, l-20,l/2.1);
  fill (210, 60, 60);
  arc (i, j-16, l-38, l/2.2, 0, PI);
  
   //cape tie
  fill (90, 170, 80);
  triangle (i, j+15, i-37, j+3, i-40, j+11);
  triangle (i, j+15, i+37, j+3, i+40, j+11);
  ellipse (i, j+15, 15, 12);
  
  //nostrils
  stroke (70,50,20);
  strokeWeight (3);
  line (i-6, j-25, i-7, j-23);
  line (i+6, j-25, i+7, j-23);
  
  // MONKEY #3
  
  int e = 450; // ctr of x axis for 1st monkey
  int f = 590; // height/2 = y ctr
  int g = 22; // arm width
  int h = 100; // head width  
  
  noStroke();
  //cape
  fill (242,239,125);
  quad (e-30, f, e+30, f, e+100, f+130, e-100, f+130);
  bezier (e+100, f+130, e+30, f+160, e-30, f+160, e-100, f+130);
  
  //body
  noStroke ();
  fill (144,116,74);
  ellipse (e, f+65, h*1.2, h*1.6);
  
 // left arm
  stroke (144,116,74);
  strokeCap(ROUND);
  strokeWeight (28);
  line(e-45, f+20, e-130, f-35);
  stroke (245,230,200);
  line (e-130, f-35, e-110, f-22);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (e-110, f-22, e-45, f+20);
  
  //right arm
  stroke (144,116,74);
  strokeCap(ROUND);
  strokeWeight (28);
  line(e+45, f+20, e+130, f-35);
  stroke (245,230,200);
  line (e+130, f-35, e+110, f-22);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (e+110, f-22, e+45, f+20);
  
  //left leg
  strokeCap (ROUND);
  strokeWeight (30);
  line (e-35, f+125, e-35, f+270);
  stroke (245,230,200);
  line (e-35, f+270, e-35, f+150);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (e-35, f+125, e-35, f+225);
  
  //right leg
  strokeCap (ROUND);
  strokeWeight (30);
  line (e+35, f+125, e+35, f+270);
  stroke (245,230,200);
  line (e+35, f+270, e+35, f+150);
  stroke (144,116,74);
  strokeCap(SQUARE);
  line (e+35, f+125, e+35, f+225);
  
  
 //monkey head
  noStroke();
  fill (144,116,74);
  arc (e,f-45,h+10,h+30, 0, TWO_PI ); 
  
  //hat
  fill (240,225,200);
  arc (e,f-65,h+5,h-10,PI, TWO_PI);
  
  //BALL on hat
  fill (242,239,125);
  ellipse (e, f-110, g+10, g+5);
  
  //rim of hat
  stroke(242,239,125);
  strokeWeight (8);
  strokeCap(ROUND);
  line(e-54,f-65,e+54,f-65);
  
  // ears
  noStroke();
  fill(144,116,74);
  ellipse (e-50,f-35,g+20,g+20); //left
  ellipse (e+50,f-35,g+20,g+20); // right
  fill (245,230,200);
  arc (e-50, f-35, g-5, g-4, PI/2, PI+HALF_PI);
  arc (e+50, f-35, g-5, g-4, -PI+PI/2, PI/2);
  
  //eyes
  fill (70,50,20);
  ellipse (e-14, f-45, g/2.4,g/2.4); //left
  ellipse (e+14, f-45, g/2.4,g/2.4); // right
  
  //mouth
  fill (245,230,200);
  ellipse (e, f-14, h-20,h/2.3);
  fill (210, 60, 60);
  arc (e, f-16, h-38, h/2.2, 0, PI);
  
   //cape tie
  fill (242,239,125);
  triangle (e, f+12, e-37, f+3, e-43, f+11);
  triangle (e, f+12, e+37, f+3, e+43, f+11);
  ellipse (e, f+15, 15, 12);
  
  //nostrils
  stroke (70,50,20);
  strokeWeight (3);
  line (e-6, f-25, e-7, f-23);
  line (e+6, f-25, e+7, f-23);
  
}

