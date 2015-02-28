
//Every Rose Has Its Thorns - Nicholas Mei - 1/23/11 build
//lets make a thorn class!
Thorn thorn;
//keeping track of how many thorns are generated
int count = 1;

void setup ()
{
size(800,800);
background(#FFFFFF); 
smooth(); 
thorn = new Thorn(); 
}

void draw ()
{
  thorn.display(); 
  //delay(50);
  //thorn.update();
  //leftover logic from another idea I had which was to have thorns enter screen from sides
  //basically if you've reached the canvas center then velocity = 0
  //also, I didn't want thorns getting too small
  if (thorn.velocity.mag() == 0 && thorn.thorn_size >= 30)
  {
     //start a new thorn if the above is true
     thorn = new Thorn();
     count++;
  }
}

//when mouse is clicked a new rose is generated!
void mouseClicked()
{
  background(#FFFFFF); 
  count = 1;
  thorn = new Thorn();
  redraw();
}


class Thorn {

  PVector location;
  PVector velocity;
  //PVector acceleration;
  
  float orientation;
  // essentially "r" of the thorns
  float thorn_size;
  // how curvy/wiggly will the outer surface be?
  float curviness;
  //how obtuse or acute will thorns be?
  float thorn_angle;
  //limits the oddity of thorn shapes and makes them smoother
  float thorn_config;
  //transformed x and y coordinates
  float tx, ty;
  //unused functionality for moving thorns
  //float splimit1, splimit2;
  
  //colors and color gradients!
  color start;
  color finish;
  color finish2;
  color gradient;
  color gradient2;
   
   //initialize thorn variables
   Thorn() 
   {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    orientation = random(0,2*PI);
    //generate a random thorn size that gets smaller over "time"
    thorn_size = random(270,300) - random(1,1.1)*count;
    curviness = random(3,7);
    thorn_angle = random(15,45);
    //limits curves from being bigger than thorn itself!
    thorn_config = random(0,thorn_size/3);
    //calculate the two sides of the thorn triangle!
    tx = abs(thorn_size * cos(radians(thorn_angle)));
    ty = abs(thorn_size * sin(radians(thorn_angle)));
    //splimit1 = 8;
    //splimit2 = 0;
    start = color(250, 18, 72);
    finish = color(255, 113, 203);
    finish2 = color(255, 255, 255);
    //color gradient functionality goes from rouge to pink
    gradient = lerpColor(start, finish, random(0.001,0.01)*count);
    //goes from pink to whitish
    gradient2 = lerpColor (finish, finish2, random(0.001, 0.003)*count);
  }
  
//displaying the thorn!  
void display()
{ 
  //previous logic used, it only gave one orientation of thorn
  //float anchorx = location.x + tx;
  //float anchory1 = location.y + ty;
  //float anchory2 = location.y - ty;
    
  //color functionality go from a rouge to a pink/white!  
  if (count <=100)
  {  
    fill(gradient);  
  }
  else
  {
    fill(gradient2);
  }
  //rotation!
  pushMatrix();
  translate(location.x,location.y);
  rotate(orientation);
  
  //building the thorn itself! Essentially two sides of a triangle
  beginShape();
  vertex(tx, ty);
  vertex(0,0);
  vertex(tx, -ty);
  curveVertex(tx, -ty); 
  curveVertex(tx, -ty); 
  //curvy section of the thorn
  for (int i = 1; i < curviness; i++)
  {
      curveVertex(tx + thorn_config, -ty +(i*2*ty)/curviness );    
  }
  curveVertex(tx, ty);
  curveVertex(tx, ty);
  endShape(); 
  //end rotation 
  popMatrix();
}

/*
void update()
{    
    PVector center = new PVector(width/2,height/2);
    PVector guide = PVector.sub(center,location);  
    PVector guide2 = PVector.sub(center,location);
    guide.normalize();   
    guide.mult(0.5);        
    acceleration = guide;  

    if (guide2.mag() >= 10)
    {
     velocity.add(acceleration);
     velocity.limit(splimit1);
     location.add(velocity);
    }
    else
    {
     velocity.sub(acceleration);
     velocity.limit(splimit2);
     location.sub(velocity);
    }
}
*/
    
}

