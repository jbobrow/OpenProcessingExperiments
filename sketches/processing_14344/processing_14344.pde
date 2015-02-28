
int x = 167;
void setup()
{
  size (200,200);
}
  
  void draw ()
  {
     background (118,6,92);
     draw_my_figure(mouseY, mouseX);
     if(mousePressed)
     {
       x = mouseY;
       kiss();
     }
     else if(mouseX>100&&mouseY<100)
     {
       tongue_right(x);
     }
     else if(mouseX<=100&&mouseY<100) tongue_left(x);
  }
  
  void draw_my_figure(int cg, int cb)
  {
    color c = color(220, cg, cb);
    upper_lip(c);
    bottom_lip(c);
    fill(0);
    down();
    fill(0);
    strokeWeight(2);
    top();
    teeth();
  }
  
  void tongue_left(color c)
  {
   
    fill (247,167,c);
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
    down();
  }
  
  void tongue_right(color c)
  {
    fill (247,167,c);
    beginShape();
    curveVertex (60,110);
    curveVertex (62,109);
    curveVertex (110,100);
    curveVertex (140,65);
    curveVertex (158,65);
    curveVertex (170,95);
    curveVertex (160,100);
    curveVertex (160,105);
    endShape(); 
        
    //strich durch die mitte, line through the middle of the tongue
    noFill();
    beginShape();
    curveVertex(96,108);
    curveVertex(96,106);
    curveVertex(135,103);
    curveVertex(147,78);
    curveVertex(147,78);
    endShape();
        
    //unten um den rand der zunge zu übermalen -> abgerundet; to paint over the togue that it fits to the shape of the mouth
    noFill();
    noFill();
    down();
  }
  
  void upper_lip (color c)
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
  
  void bottom_lip (color c)
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
  
  void top ()
  {
    curve (10,190,27,100,175,100,190,190); 
  }
  
  void down()
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
    top();
  }
  
  void kiss()
  {
    background (118,6,92);
    strokeWeight (4);
    //oberlippe; upper lip
    fill (220,0,20);
    beginShape ();
    curveVertex (50,100);
    curveVertex (50,100);
    curveVertex (75,63);
    curveVertex (98,65);
    curveVertex (98,65);
    curveVertex (125,64);
    curveVertex (150,100);
    curveVertex (150,100);
    endShape ();
    //unterlippe; bottom lip
    fill (220,0,20);
    beginShape();
    curveVertex (50,100);
    curveVertex (50,100);
    curveVertex (70,140);
    curveVertex (100,145);
    curveVertex (130,140);
    curveVertex (150,100);
    curveVertex (150,100);
    endShape();
     
   //oben; top
    strokeWeight (4);
    fill(0);
    curve (10,150,65,100,135,100,190,150);
    
    //unten; down
    strokeWeight (4);
    curve (30,50,75,100,125,100,170,50);
    line (90,106,75,120);
    line (110,106,125,120);
    line (90,93,80,80);
    line (110,93,120,80);
    line (100,106,100,130);
  }

