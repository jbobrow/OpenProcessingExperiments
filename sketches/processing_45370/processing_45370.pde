
      KWASS[] kwasswoom = new KWASS[4];
KWASS owbject;
KWASS Ahbject;


void setup()
{
  size(400, 400, P3D);
  background(200);
  translate(width/2, height/2, 0);
  lights();
  pushMatrix();
  sphere(100);
  translate(50, 100, 40);
  box(50);
//  owbject = new KWASS(50, 50, 50, 50);
//  Ahbject = new KWASS(200, 200, 70, 70);
  float changeKWASSx = 0; 
  float changeKWASSy = 0;
  float changeKWASSz = 0;
  float changeKWASSrad = 50;
  for(int index = 0; index <kwasswoom.length; index++)
  {
    kwasswoom[index] = new KWASS(changeKWASSx, changeKWASSy, changeKWASSz, changeKWASSrad);
    changeKWASSx += 100;
    changeKWASSy += 100;
    changeKWASSz += 1;
    
    
  }
  

}

//stay in middle of the screen

void draw()
{
  background(0);
  fill(random(255),random(255),random(255));
//  translate(mouseX, height/2, mouseY);
//  sphere(40);
  //translate(mouseX,height*.9,-mouseY);
  //sphere(40);
//  owbject.makeSphere();
//  Ahbject.makeSphere();
  for(int index = 0; index <kwasswoom.length; index++)
  {
    kwasswoom[index].makeSphere();
    
    
  }
 
}       
                
