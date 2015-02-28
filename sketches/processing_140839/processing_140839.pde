
float angle=0.0;
float offset=60;
float scalar=30;
float speed=0.5;
float fc1, fc2; // global variables used by all vertices for their dynamic movement
int numTriangles=5;
int numRects=120;
int numColors=numRects;
color[] colors = new color[numColors]; // array to store a selection of random colors
color[] colors1 = new color[numColors]; // array to store a selection of random colors
color[] colors2 = new color[numColors]; // array to store a selection of random colors
float rectw=20;float recth=20;
int alphaRect;float alphax; float alphay; 
int alphaRect2;float alphax2; float alphay2; //to track alpha rectangle


triangles[] tarray=new triangles[numTriangles]; 
rectangles[] rs=new rectangles[numRects];
rectangles[] rs2=new rectangles[numRects];
rectangles[] rs3=new rectangles[numRects];
rectangles[] rs4=new rectangles[numRects];
int numEllipses=200;
ellipses[] eps=new ellipses[numEllipses];
//color ballColor=color(0,0,255);
color ballColor=color(180,200,208);





void setup(){
  size(400,400);
  smooth();
  println(width);
  println(height);
  //randomColors(colors1, 35,41, 100,112, 200,255);
  randomColors(colors1, 50,53, 52,54, 115,118);
    randomColors(colors1, 71,71,132,132,179,179); //for white backg
  //randomColors(colors1, 0,round(random(250)), 0, round(random(250)), 0,round(random(250)));
  //randomColors(colors2, 40,44, 60,63, 70,75);
  randomColors(colors2, 180,186, 200,215, 200,208);//for white backg
  randomColors(colors, 0,44, 0,63, 0,75);
  randomColors(colors,180,186, 200,215, 200,208); //for white backgr
  //noLoop();//to record video


  background(0);
  float r,r2;
  //triangles
  //create rectangles
  for(int i=0;i<numRects;i++)
  {
    rs[i]=new rectangles(random(width),random(height),50,50,i,rs);
    rs2[i]=new rectangles(random(width),random(height),25,25,i,rs2);
        //rs3[i]=new rectangles(random(width),random(height),60.0,20.0,i,rs3);
        //rs4[i]=new rectangles(random(width),random(height),60.0,20.0,i,rs4);
  }
  for(int i=0;i<numEllipses;i++){
    float t=random(20);
    eps[i]=new ellipses(random(width),random(height),t,t,i,eps);
  }
  
  
  
}

void draw(){
  float x=offset+cos(angle)*scalar;
  float y=offset+sin(angle)*scalar;
  background(color(20,20,20));
  background(color(180,200,200)); //gray
//  fill(color(50,20,5));
//  ellipse(x,y,40,40);
//  ellipse(round(width*.5),round(height*.5),70,70); //ellipse in the center of screen
//  quad(x+60,y+60,x+80,y+65,x+77,y+90,x+62,y+80);
//  angle+=speed;
  fc1 = frameCount*0.01;
  fc2 = frameCount*0.02;
  strokeWeight(2); 
//   if(frameCount%50==0)
//   strokeWeight(random(5));
  //drawShape(round(width*.5),round(height*.5), LINES, width, 150, 33);
  //randomshape();
  fill(200);
  strokeWeight(2);
  stroke(0);
   for(int i=0;i<numRects;i++)
  {
    fill(colors1[i]);
    if(i%2==0){rs[i].move("left");rs2[i].move("up");}
    else{rs[i].move("right");rs2[i].move("down");}
    rs[i].display();
    //if(i%7==0) //random factor
    rs[i].checkcollision(rs);
    fill(colors2[i]);
    rs2[i].display();
    //if(i%7==0) //random factor
    //rs2[i].checkcollision(rs);
    rs2[i].checkcollision(rs2);
    rs[i].rectAlpha(rs2);
    alphaRect=rs[i].rectAlpha(rs);
    alphaRect2=rs2[i].rectAlpha(rs2);
    //println(i + " No collision");
    //rs2[i].display();
    
    //make rectangles grow
    //rs2[i].w+=1;rs2[i].h+=1;
    //rs[i].w+=1;rs[i].h+=1;
  }
  //to show ellipses following alpha rects
  alphax=rs[alphaRect].x;alphay=rs[alphaRect].y;
  alphax2=rs2[alphaRect2].x;alphay2=rs2[alphaRect2].y;
  for(int i=0;i<numEllipses;i++)
  {
    //fill(color(49,186,122));
    fill(ballColor);
    if(i%2==0){
    eps[i].moveTowards(alphax,alphay);}
    else{
    eps[i].moveTowards(alphax2,alphay2);}
    //if(i%2==0){stroke(0);}else{stroke(250);}
    eps[i].display();
  }

  //reboot ellipses and rects
//  if(frameCount%300==0){eps[0].randomlyDisplay(eps);}
//  if(frameCount%300==0){  
//    for(int i=0;i<numRects;i++)
//      { rs[i]=new rectangles(random(width),random(height),50,50,i,rs);
//        rs2[i]=new rectangles(random(width),random(height),25,25,i,rs2);}
//    }
  
//    if(frameCount%10==0){
//        rectw+=1;recth+=1;
//        for(int i=0;i<numRects;i++)
//      {
//        rs[i]=new rectangles(random(width),random(height),rectw,recth,i,rs);
//        //rs2[i]=new rectangles(random(width),random(height),25,25,i,rs2);
//      }
//    }
  
//  if (frameCount % 5 == 0 && frameCount < 150)//save frames for gif
//  saveFrame("image-####.gif");


 


 
} 
 


// custom drawShape() method with input parameters for the location, shapeMode, diameters and number of segments
void drawShape(int x, int y, int mode, float diam_inner, float diam_outer, int numSegments) {
  pushMatrix(); // use push/popMatrix so each Shape's translation does not affect other drawings
  translate(x, y);
  if (mode==POINTS || mode==LINES) {
    // for POINTS and LINES use a white, extra thick stroke
    strokeWeight(2);
    stroke(255);
  } else if (mode==QUAD_STRIP || mode==TRIANGLE_STRIP) {
    // for QUAD_STRIP and TRIANGLE_STRIP use a white, regular stroke
    strokeWeight(1);
    stroke(255);
  } else {
    // for all other shapeModes do not use stroke
    noStroke();
  }
  beginShape(mode); // input the shapeMode in the beginShape() call
  if (mode==TRIANGLE_FAN) { vertex(0, 0); } // for the TRIANGLE_FAN a central point is important
  float step = TWO_PI/numSegments; // generate the step size based on the number of segments
  for (int i=0; i<numSegments+1; i++) { // +1 so we connect start and end
    int im = i==numSegments?0:i; // make sure the end equals the start
    float theta = step * im; // angle for this segment (both vertices)

    // calculate x and y based on angle
    float tx = sin(theta);
    float ty = cos(theta);

    // each vertex has a noise-based dynamic movement
    float dynamicInner = 0.5 + noise(fc1+im);
    float dynamicOuter = 0.5 + noise(fc2+im);

    // draw the inner and outer vertices based on the angle, radius and dynamic movement
    // for the QUADS mode reverse every other segment to form a correct QUAD
    if (mode==QUADS && i%2==0) {
      fill(colors[im%colors.length]); // get a color from the palette
      vertex(tx*diam_outer*dynamicOuter, ty*diam_outer*dynamicOuter);
      fill(colors[(im+1)%colors.length]); // get a different +1 color from the palette
      vertex(tx*diam_inner*dynamicInner, ty*diam_inner*dynamicInner);
    } else {
      fill(colors[im%colors.length]); // get a color from the palette
      vertex(tx*diam_inner*dynamicInner, ty*diam_inner*dynamicInner);
      fill(colors[(im+1)%colors.length]); // get a different +1 color from the palette
      vertex(tx*diam_outer*dynamicOuter, ty*diam_outer*dynamicOuter);
    }
  }
  endShape(); // finalize the Shape
  popMatrix(); // use push/popMatrix so each Shape's translation does not affect other drawings
}

void randomshape(){
  //fill(200);
  fill(color(random(255),random(255),random(255)));
  float diff=20;float inix=random(float(width));float iniy=random(float(height));
  noStroke();
  smooth();
  //beginShape();
  //vertex(inix,iniy,inix+random(-diff,diff),iniy+random(-diff,diff)
  quad(inix,iniy,inix+random(-diff,diff),iniy+random(-diff,diff),inix+random(-diff,diff),iniy+random(-diff,diff),inix+random(-diff,diff),iniy+random(-diff,diff));
  
}

void randomColors(color[] colors, int r1,int r2, int g1,int g2, int b1,int b2) {
  for (int i=0; i<colors.length; i++) {
    //colors[i] = color(random(255),random(20),random(20));
    colors[i] = color(random(r1,r2),random(g1,g2),random(b1,b2));
  }
}

class triangles{
  float x1,x2,x3,y1,y2,y3,id;
  float vx=.3;float vy=.3;
  triangles[] ts;
  //constructor
  triangles(float x1a, float y1a, float x2a, float y2a, float x3a, float y3a,float ida, triangles[] tsa){
  x1=x1a;x2=x2a;x3=x3a;y1=y1a;y2=y2a;y3=y3a;id=ida;
  ts=tsa;
  }
  
  void move(){
    x1+=vx;x2+=vx;x3+=vx;
    y1+=vy;y2+=vy;y3+=vy;
    }
  void display(){
    triangle(x1,y1,x2,y2,x3,y3);
    }
}

class rectangles{
  float x,y,w,h,id;
  float speed=0.3;
  rectangles[] rts;
  //constructor
  rectangles(float xc, float yc, float wc, float hc,int idc, rectangles[] rts)
   {
     x=xc;y=yc;w=wc;h=hc;id=idc;
   }
  void move(String where){
   if(where=="right"){x+=speed;}
   else if(where=="left"){x-=speed;}
   else if(where=="up"){y+=speed;}
   else if(where=="down"){y-=speed;}
   else if(where=="diag1"){y-=speed;x+=speed;}
   else if(where=="diag2"){y+=speed;x+=speed;}
   else if(where=="diag3"){y-=speed;x-=speed;}
   else if(where=="diag4"){y+=speed;x-=speed;}
  }
  void checkcollision(rectangles[] rts){
  float x2=x+w; float y2=y+h;
  float btmedge=y+h; //bottom
  float tpedge=y; //top edge
  float lftedge=x; //left edge
  float rgtedge=x+w; //right edge
  //println(btmedge,tpedge,lftedge,rgtedge);
  boolean colFlag=false;
//  strokeWeight(5);
//  stroke(250);
//  fill(250);
//  point(lftedge,tpedge);//upper left point
//  text(tpedge,lftedge,tpedge);
//  point(rgtedge,tpedge);//upper right point
//  text(rgtedge,rgtedge,tpedge+h/2);
//  point(lftedge,btmedge);//lower left point
//  text(lftedge,lftedge-w,btmedge-h/2);
//  point(rgtedge,btmedge);//lower right point
//  text(btmedge,lftedge+w/8,btmedge+h/10);//lower right point
//  strokeWeight(2);
  
// ######to check if there is NO collision, ANY of the following conditions must exist.########
//    Rectangle 1′s bottom edge is higher than Rectangle 2′s top edge.
//    Rectangle 1′s top edge is lower than Rectangle 2′s bottom edge.
//    Rectangle 1′s left edge is to the right of Rectangle 2′s right edge.
//    Rectangle 1′s right edge is to the left of Rectangle 2′s left edge.
  for(int j=0;j<rts.length;j++) //check rectange against all rectangles
  {
    if(j!=id){ //to not check collition against itself
//      println("Bottom",'<', "Top  " ," Top" ,'>',"Bottom" ,"Left",'>',"Right " , " Right ",'<'," Left ");
//      println(btmedge,'<', rts[j].y ,tpedge,'>',rts[j].y+h ,lftedge,'>',rts[j].x+w , rgtedge,'<',rts[j].x);
//      println((btmedge<rts[j].y) ,(tpedge>rts[j].y+h) ,(lftedge>rts[j].x+w) ,(rgtedge<rts[j].x));
      
      //print(!((btmedge<rts[j].y) ||(tpedge>rts[j].y+h) ||(lftedge>rts[j].x+w) ||(rgtedge<rts[j].x))); //prints collision state
      if(!((btmedge<rts[j].y) ||(tpedge>rts[j].y+h) ||(lftedge>rts[j].x+w) ||(rgtedge<rts[j].x))==true)
      {
        int c=round(random(numRects-1));
        colFlag=true;
        fill(colors[c]);
        w-=.05*w; h-=.05*h;
        display();
        divideRects();
        break; 
                
      }
      if(rgtedge>width || lftedge<0 )//out of the screen horizontally..
      {
        fill(240);
        //w=width;
        x=random(width);y=random(height); //back in the game
        display();
        break;
      }
      if(tpedge<0 || btmedge>height )//out of the screen vertically..
      {
        //fill(240);
        //h=height;
        x=random(width);y=random(height); //back in the game
        display();
        break;
      }
      
    }
  }


  }
  
 float dx=.05; float dy=.05;
 int cr=250,cg=240,cb=41;
 
 void divideRects()
  {
    for(int k=0;k<20;k++){
    dx+=.1;dy+=.1;  
//    rect(x-dx,y+dy,w/2,h/2);//upper left rect, moving diagonal
//    rect(x+w/2+dx,y+dy,w/2,h/2);//upper right rect
//    rect(x-dx,y-h/2-dx,w/2,h/2);//lower left rect
//    rect(x+w/2+dx,y-h/2-dy,w/2,h/2);//lower right rect
    if(k>190){
    fill(color(cr,cg,cb));
    cr-=.5;cg-=.5;cb-=.5;
    //cr=20;
    //cb-=.5;
    //cg-=.5;
     }
    //if(k==199){println(cr,cb,cg);}
    //cg-=.5;
    //stroke(240);
    rect(x-dx+sin(x),y+dy+sin(y),w/2,h/2);//upper left rect, moving diagonal
    rect(x+w/2+dx+sin(dx),y+dy+sin(dy),w/2,h/2);//upper right rect
    rect(x-dx+sin(dx),y-h/2-dy+sin(dy),w/2,h/2);//lower left rect
    rect(x+w/2+dx+sin(dx),y-h/2-dy+sin(dy),w/2,h/2);//lower right rect
    stroke(0);
    }
  }
  int rectAlpha(rectangles[] rts)
  {
    float maxArea=0; int maxRect=0;
   for(int k=0;k<rts.length;k++)
   {
     if(maxArea<rts[k].w*rts[k].h){
       maxArea=rts[k].w*rts[k].h;
       maxRect=k;
     }
   }
    fill(color(188,108,202)); //pink...
    fill(color(186, 200, 200)); //alpha color
    stroke(color(71,132,179));
    strokeWeight(5);
    rts[maxRect].display();
    stroke(0);
    strokeWeight(2);
   return maxRect; 
  }
   
 void display(){
 rect(x,y,w,h);
 }

   
}

class ellipses{
  float x,y,w,h,id;
  float speed=0.08;
  ellipses[] eps;
  //constructor
  ellipses(float xc, float yc, float wc, float hc,int idc, ellipses[] eps)
   {
     x=xc;y=yc;w=wc;h=hc;id=idc;
   }
   void moveTowards(float xo,float yo){
     //float dx=0.2;float dy=0.2;
     float dx=0.3;float dy=0.3; float mov=0.9;
     //check where current position is in relation with target
     if(x<xo && y>yo)//lower left
       {x+=dx+sin(random(20));y-=dy+sin(random(20));}//{x+=dx;y-=dy;}
     else if(x>xo && y>yo){//lower right
       x-=dx+sin(random(20));y-=dy+sin(random(20));}//x-=dx;y-=dy;}
     else if(x<xo && y<yo)//upper left
       {x+=dx+sin(noise(20));y+=dy+sin(random(20));}//{x+=dx;y+=dy;}
     else if(x>xo && y<yo)//upper right
       {x-=dx+sin(random(20));y+=dy+sin(random(20));};//{x-=dx;y+=dy;};
   }
   
   void randomlyDisplay(ellipses[] eps){
     for(int i=0;i<eps.length;i++)
     {
       eps[i].x=random(width);eps[i].y=random(height);
     }
   }
   
   void display(){
     ellipse(x,y,w,h);
     }  
}

void keyPressed(){
  if (key==ENTER){
      noLoop();  }
    if (key==TAB){
      loop();  }
}




  
 



