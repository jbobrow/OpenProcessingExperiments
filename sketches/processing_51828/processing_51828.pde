
PImage f1, f2, f3, f4, f5, ftmp;
float x, y, d;
float x1, x2,x3, x4, x5;
float y1, y2,y3, y4, y5;
float d1, d2, d3, d4, d5;
PImage kont, m,b;

int index;
  
void setup() {
  size(600, 600);



  frameRate(30);
  imageMode(CENTER);

  kont = loadImage("interkont.png");
  m = loadImage("interm.png");
  b = loadImage("dmaback.png");
  for (int i = 0; i < 5; i++) //how many pictures on screen
  {
    index = round(random(1, 19)); //pictures source
    x = random(width);
    y = random(height);
    d = random(100, 300);

    switch(index) {
    case 1: 
         ftmp = loadImage("workshop4template.png");
        break;
    case 2: 
         ftmp = loadImage("inter2.png");
        break;
            case 3: 
         ftmp = loadImage("inter3.png");
        break;
            case 4: 
         ftmp = loadImage("inter4.png");
        break;
            case 5: 
         ftmp = loadImage("inter5.png");
        break;
            case 6: 
         ftmp = loadImage("inter6.png");
        break;
            case 7: 
         ftmp = loadImage("inter7.png");
        break;
            case 8: 
         ftmp = loadImage("inter8.png");
        break;
            case 9: 
         ftmp = loadImage("inter9.png");
        break;
            case 10: 
         ftmp = loadImage("inter10.png");
        break;
                    case 11: 
         ftmp = loadImage("inter11.png");
        break;
                    case 12: 
         ftmp = loadImage("inter12.png");
        break;
            case 13: 
         ftmp = loadImage("inter13.png");
        break;
            case 14: 
         ftmp = loadImage("inter14.png");
        break;
            case 15: 
         ftmp = loadImage("inter15.png");
        break;
            case 16: 
         ftmp = loadImage("inter16.png");
        break;
            case 17: 
         ftmp = loadImage("inter17.png");
        break;
            case 18: 
         ftmp = loadImage("inter18.png");
        break;
                    case 19: 
         ftmp = loadImage("inter19.png");
        break;

     default:
    break;
    }
    
    switch(i+1) {
    case 1: 
         f1 = ftmp;
         x1 = x;
         y1 = y;
         d1 = d;
         image(f1, x1, y1, d1, d1);
        break;
    case 2: 
         f2 = ftmp;
         x2 = x;
         y2 = y;
         d2 = d;
         image(f2, x2, y2, d2, d2);
        break;
        case 3: 
         f3 = ftmp;
         x3 = x;
         y3 = y;
         d3 = d;
         image(f3, x3, y3, d3, d3);
        break;
            case 4: 
         f4 = ftmp;
         x4 = x;
         y4 = y;
         d4 = d;
         image(f4, x4, y4, d4, d4);
        break;
            case 5: 
         f5 = ftmp;
         x5 = x;
         y5 = y;
         d5 = d;
         image(f5, x5, y5, d5, d5);
        break;
  
     default:
    break;
    }
    
    
  }
}

  
void draw() {
    

  if((frameCount%30) == 0)
  {
 for (int i = 0; i < 5; i++) //how many pictures on screen
  {
    index = round(random(1, 19)); //pictures source
    x = random(width);
    y = random(height);
    d = random(100, 300);
    
    switch(index) {
    case 1: 
         ftmp = loadImage("workshop4template.png");
        break;
    case 2: 
         ftmp = loadImage("inter2.png");
        break;
            case 3: 
         ftmp = loadImage("inter3.png");
        break;
            case 4: 
         ftmp = loadImage("inter4.png");
        break;
            case 5: 
         ftmp = loadImage("inter5.png");
        break;
            case 6: 
         ftmp = loadImage("inter6.png");
        break;
            case 7: 
         ftmp = loadImage("inter7.png");
        break;
            case 8: 
         ftmp = loadImage("inter8.png");
        break;
            case 9: 
         ftmp = loadImage("inter9.png");
        break;
            case 10: 
         ftmp = loadImage("inter10.png");
        break;
                    case 11: 
         ftmp = loadImage("inter11.png");
        break;
                    case 12: 
         ftmp = loadImage("inter12.png");
        break;
            case 13: 
         ftmp = loadImage("inter13.png");
        break;
            case 14: 
         ftmp = loadImage("inter14.png");
        break;
            case 15: 
         ftmp = loadImage("inter15.png");
        break;
            case 16: 
         ftmp = loadImage("inter16.png");
        break;
            case 17: 
         ftmp = loadImage("inter17.png");
        break;
            case 18: 
         ftmp = loadImage("inter18.png");
        break;
                    case 19: 
         ftmp = loadImage("inter19.png");
        break;

     default:
    break;
    }
    
    switch(i+1) {
    case 1: 
         f1 = ftmp;
         x1 = x;
         y1 = y;
         d1 = d;
         image(f1, x1, y1, d1, d1);
        break;
    case 2: 
         f2 = ftmp;
         x2 = x;
         y2 = y;
         d2 = d;
         image(f2, x2, y2, d2, d2);
        break;
        case 3: 
         f3 = ftmp;
         x3 = x;
         y3 = y;
         d3 = d;
         image(f3, x3, y3, d3, d3);
        break;
            case 4: 
         f4 = ftmp;
         x4 = x;
         y4 = y;
         d4 = d;
         image(f4, x4, y4, d4, d4);
        break;
            case 5: 
         f5 = ftmp;
         x5 = x;
         y5 = y;
         d5 = d;
         image(f5, x5, y5, d5, d5);
        break;

     default:
    break;
    }
    
    
  }
  }

  else
  {
    background(255);
    image(b,300,300); 
    image(f1, x1 +random(-5,5), y1 +random(-5,5), d1 +random(-10,10), d1+random(-10,10));
    image(f2, x2 +random(-5,5), y2 +random(-5,5), d2 +random(-10,10), d2+random(-10,10));
    image(f3, x3 +random(-5,5), y3 +random(-5,5), d3 +random(-10,10), d3+random(-10,10));
    image(f4, x4 +random(-5,5), y4 +random(-5,5), d4 +random(-10,10), d4+random(-10,10));
    image(f5, x5 +random(-5,5), y5 +random(-5,5), d5 +random(-10,10), d5+random(-10,10));

  }  
  
  image(kont,225+random(-3,3),300,250,250);
  image(m,375+random(-3,3),300,250,250);
  println(frameCount);

}



