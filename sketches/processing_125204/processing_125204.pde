
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/125149*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*@pjs preload=u.png, d.png, 0.jpg, 1.jpg, 2.jpg, 3.jpg*/
Pantalla p = new Pantalla(0);
Boto u;
Boto d; 
int pantact;

void setup(){ 
  pantact=0; 
  size(800, 600);
  background(255);
  u = new Boto(true);
  d = new Boto(false);
}



void draw(){
  p.processa(pantact, u, d);

}

void mouseReleased(){

  if (mouseX > width*0.2 && mouseX < width*0.3 && mouseY > height*0.8 && mouseY < height && pantact > 0)  --pantact;
  else if (mouseX > width*0.8 && mouseX < width*0.95 && mouseY > height*0.8 && mouseY < height && pantact <3) ++pantact; 

}
class Boto{

  
  float x;
  float y;
  PImage pic;

  
  Boto(boolean esquerra) 

  {
    
    if (esquerra){
      x=width*0.2;
     pic=loadImage("u.png");
    }
    else {
      x=width*0.8;
     pic=loadImage("d.png");
    }
    
    y = height*0.8;

  }

  void mostra(){
   image(pic, x, y);
  }
  
}
class Pantalla{
  int pantact;
  PImage fons;
  
  Pantalla(int act){
    pantact=act;
  }
  
  void processa(int act, Boto u, Boto d){
	pantact = act;
	switch(pantact){
            case 0: 
			fons=loadImage("0.jpg");
                        image(fons,0,0);
			d.mostra();
			break;
		
		case 1:
			
                        fons=loadImage("1.jpg");
                        image(fons,0,0);
			u.mostra();
			d.mostra();
			break;
		case 2: 
                        fons=loadImage("2.jpg");
                        image(fons,0,0);
			u.mostra();
			d.mostra();
			break;
		case 3:
                        fons=loadImage("3.jpg");
                        image(fons,0,0);
			u.mostra();
			break;
            default: ;
		
	}       
  }
  
  




}



