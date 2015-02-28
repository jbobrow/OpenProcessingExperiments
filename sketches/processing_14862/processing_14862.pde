
class mouth
{
  int x;
  int y;
  color c;
  
  mouth (int xstart, int ystart)
  {
    x=xstart;
    y=ystart;
    c = color(220, 0, 20);
  }
  
  void move(int m, int n)
  {
    x=x+m;
    y=y+n;
  }
                                                                                                                                                                                                  
  void display()
  {
    upper_lip();
    bottom_lip();
    down();
    top();
    lines();
  }
  
 int giveX()
 {
   return x;
 }
 
 int giveY()
 {
   return y;
 }
  
 void upper_lip()
 {
   strokeWeight (4);
   //oberlippe
   fill (c);
   beginShape ();
   curveVertex (x,y+37);
   curveVertex (x,y+37);
   curveVertex (x+25,y);
   curveVertex (x+48,y+2);
   curveVertex (x+48,y+2);
   curveVertex (x+75,y+1);
   curveVertex (x+100,y+37);
   curveVertex (x+100,y+37);
   endShape ();
 }
  
  void bottom_lip ()
  {
    strokeWeight (4); 
    fill (c);
    beginShape();
    curveVertex (x,y+37);
    curveVertex (x,y+37);
    curveVertex (x+20,y+77);
    curveVertex (x+50,y+82);
    curveVertex (x+80,y+77);
    curveVertex (x+100,y+37);
    curveVertex (x+100,y+37);
    endShape();
  }
   
   void top ()
   {
    strokeWeight (4);
    fill(0);
    curve (x,y+82,x+15,y+37,x+85,y+37,x+100,y+82);
   }
    
   void down ()
   {
    strokeWeight (4);
    fill(0);
    curve (x,y,x+25,y+37,x+75,y+37,x+100,y);
   }
   
   void lines ()
   {
    line (x+40,y+43,x+25,y+57);
    line (x+60,y+43,x+75,y+57);
    line (x+40,y+30,x+30,y+17);
    line (x+60,y+30,x+70,y+17);
    line (x+50,y+43,x+50,y+57);
  }
  
  void display_full()
  {
    upper_lip_full();
    bottom_lip_full();
    fill(0);
    down_full();
    fill(0);
    strokeWeight(2);
    top_full();
    teeth();
    tongue_left();
  }
  
  void tongue_left()
  {
   
    fill (247,167,167);
    beginShape();
    curveVertex (140,110);
    curveVertex (138,109);
    curveVertex (90,100);
    curveVertex (60,65);
    curveVertex (42,65);
    curveVertex (30,95);
    curveVertex (40,100);
    curveVertex (40,105);
    endShape(); 
        
    //strich durch die mitte; line through the middle of the tongue
    noFill();
    beginShape();
    curveVertex(104,108);
    curveVertex(104,106);
    curveVertex(65,103);
    curveVertex(53,78);
    curveVertex(53,78);
    endShape();
        
    //unten um den rand der zunge zu übermalen -> abgerundet; to paint over the togue that it fits to the shape of the mouth
    noFill();
    down_full();
  }
  
  void upper_lip_full ()
  {
    strokeWeight (4);
    fill (c);
    beginShape ();
    curveVertex (20,100);
    curveVertex (20,100);
    curveVertex (70,63);
    curveVertex (98,65);
    curveVertex (98,65);
    curveVertex (130,64);
    curveVertex (180,100);
    curveVertex (180,100);
    endShape ();
  }
  
  void bottom_lip_full ()
  {
    strokeWeight(4);
    fill (c);
    beginShape();
    curveVertex (20,100);
    curveVertex (20,100);
    curveVertex (65,140);
    curveVertex (100,145);
    curveVertex (135,140);
    curveVertex (180,100);
    curveVertex (180,100);
    endShape();
  }
  
  void top_full ()
  {
    curve (10,190,27,100,175,100,190,190); 
  }
  
  void down_full()
  {
    strokeWeight (4);
    curve (30,10,40,100,160,100,170,10);
  }
  
  void teeth()
  {
    fill (255);
    strokeWeight (1);
    //schneidezähne; big teeth in the middle
    rect (78, 88, 20, 18);
    rect (99, 88, 20, 18);
    //zähne rechts; right teeth
    rect (120, 89, 17, 15);
    rect (137, 91, 14, 10);
    rect (151, 93, 13, 6);
    //zähne links; left teeth
    rect (60, 89, 17, 15);
    rect (46, 91, 14, 10);
    rect (33, 95, 13, 4);
    
    //oben um den rand der zähne zu übermalen -> abgerundet; to paint over the teeth that it fits to the shape of the mouth
    noFill();
    noFill();
    strokeWeight(3);
    top_full();
  }
  
}

