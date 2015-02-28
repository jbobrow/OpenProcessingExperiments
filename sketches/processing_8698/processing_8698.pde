
int objnum = 0;   //initial quad numbers
int totalobj = 10000;   //array size for quads
quadobj[] quads;


void setup(){
  quads = new quadobj[totalobj + 1];
  size(400,400);
  randomSeed(millis());

}

void draw(){
  background(255);
  if(objnum >= 1){
    for(int i = 1 ; i <=objnum; i++){
      quads[i].goplay();                                 //draw quads
    } 
  }
}

void mousePressed(){
  int num,objw,objl,colr = 0,colg = 0,colb = 0;
  float locx,locy,angle = 0.0,vely;

  if(keyPressed){
    if(key == 'a' || key == 'A'){                         //quads to left, random color
      angle = -1 * (floor(random(5))+1);
      colr = floor(random(230));
      colg = floor(random(230));
      colb = floor(random(230));
    }
    else if(key == 's' || key == 'S'){                   //quads to right, random color
      angle = 1 * (floor(random(5))+1);
      colr = floor(random(230));
      colg = floor(random(230));
      colb = floor(random(230));
    }
    else if(key == 'r' || key == 'R' ){                 //rect, color to red
      colr = floor(random(180))+70;
      colg = floor(random(50));
      colb = floor(random(50));
    }
    else if(key == 'g' || key == 'G'){                 //rect, color to green
      colr = floor(random(50));
      colg = floor(random(180))+70;
      colb = floor(random(50));
    }
    else if(key == 'b' || key == 'B'){               //rect, color to blue
      colr = floor(random(50));
      colg = floor(random(50));
      colb = floor(random(180))+70;
    }
    else if((key == 'e' || key == 'E') ){           //quads to left, color to red
      angle = -1 * (floor(random(5))+1);
      colr = floor(random(180))+70;
      colg = floor(random(50));
      colb = floor(random(50));
    }
    else if((key == 'f' || key == 'F') ){            //quads to left, color to green
      angle = -1 * (floor(random(5))+1);
      colr = floor(random(50));
      colg = floor(random(180))+70;
      colb = floor(random(50));
    } 
    else if((key == 'v' || key == 'V') ){          //quads to left, color to blue
      angle = -1 * (floor(random(5))+1);
      colr = floor(random(50));
      colg = floor(random(50));
      colb = floor(random(180))+70;
    }
    else if((key == 't' || key == 'T') ){        //quads to right, color to red
      angle = 1 * (floor(random(5))+1);
      colr = floor(random(180))+70;
      colg = floor(random(50));
      colb = floor(random(50));
    }
    else if((key == 'h' || key == 'H') ){        //quads to right, color to green
      angle = 1 * (floor(random(5))+1);
      colr = floor(random(50));
      colg = floor(random(180))+70;
      colb = floor(random(50));
    } 
    else if((key == 'n' || key == 'N') ){        //quads to right, color to blue
      angle = 1 * (floor(random(5))+1);
      colr = floor(random(50));
      colg = floor(random(50));
      colb = floor(random(180))+70;
    } 
  }
  if(keyPressed == false){                         //no keypressed, rect and random color
    colr = floor(random(230));
    colg = floor(random(230));
    colb = floor(random(230));
  }
  num=floor(random(15)) +2;
  objw = floor(random(25)) + 2;
  objl = floor(random(15)) + 2;
  locx = mouseX;                                   //quads' foundation location
  locy = mouseY + objl;
  vely = (floor(random(10)) + 1) * 0.2;
  for(int x =1; x<=num; x++){
    quads[x+objnum] = new quadobj(locx + angle*(x-1), locy-(x-1)*objl, objw, objl, angle, colr + x*7, colg+ x*7, colb +x*7, vely, locx, 0);  //create quads 
  }
  objnum = objnum + num;
  println(objnum);
}

void keyPressed(){
  if(key == 'x' || key == 'X'){
    if(objnum>=20){
      for(int i =1; i<=20 ; i++){
        quads[floor(random(objnum))+1].objw =  quads[floor(random(objnum))+1].objw + floor(random(20));              //random 20 quads, resize them
        quads[floor(random(objnum))+1].objw =  quads[floor(random(objnum))+1].objl + floor(random(20));
      }
    }
  }
  if(key == 'c' || key == 'C'){   //clear the draw table
    background(255);
    objnum = 0;
  }
}













