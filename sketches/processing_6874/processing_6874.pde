
/////////////////////////////////////////
/*Pseudo_3D_Cloth by Marcos Frankowicz */
/*             07/01/2010              */
/////////////////////////////////////////

int num = 420;
PImage pi;
ArrayList clothArrayList = new ArrayList();

void setup(){
  size(900,590,P2D);
//  size(1600,590,P2D);
  pi = loadImage("image.jpg"); //Sistine Chapel
   addCloth(clothArrayList);
}

void draw(){
  background(0);
  for(int i = 0; i<clothArrayList.size();i++){
    Cloth ponto = (Cloth) clothArrayList.get(i);
    ponto.render(pi);
  }
}

color getColor(PImage p, int x, int y){
  int MouseX =(int) map(mouseX,0,width,-200,140);
  int MouseY =(int) map(mouseY,0,height,1200,0);
  color c = p.get(x+MouseX,y+MouseY);
  return c;
}

void addCloth(ArrayList arraylist){
  arraylist.add(new Cloth());
}
/*
void keyPressed(){
  if(key == 'p'){
    saveFrame("imagePNG-####.png");
  }
  if(key == 't'){
    saveFrame("imageTGA-####.tga");
  }
  if(key == 'j'){
    saveFrame("imageJPG-####.jpg");
  }
}
*/
 
    
  


