
int num = 40;


thing[] stuff = new thing[num];
 color[] Colors = new color[4];

void setup(){
size(400,400);
smooth();
rectMode(CENTER);

  Colors[0] = color(40,5);
Colors[1] = color(255, 29, 153, 5);
  Colors[2] = color(228, 111, 48, 5);
  Colors[3] = color(34,127,101,5);

 for(int z=0;z<num;z++){
stuff[z]= new thing();
 }
}

void draw()
{
  for(int v=0;v<num; v++){
stuff[v].update();
 stuff[v].display();
  }
}
  
  
  
  class thing{
    
    float x = random(15,width-15);
    float y =random(15,height-15);
    color mycol = Colors[floor(random(0,4))];

    thing(){
    }
    
    void update(){
    
x=x+random(-6,6);
y=y+random(-6,6);
    }
    
    
    void display(){
      noStroke();
      fill(mycol);
rect(x,y,30,30);
//rect
    
    }
  }

