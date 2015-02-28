

void setup() {

size(600,600);
  background(255);
  frameRate(60); //60 Bilder pro sekunde

}



void draw () {


 
if (mousePressed && (mouseButton == RIGHT)) {
    noStroke();
  ellipse(mouseX+random(1,20),
          mouseY+random(1,20),
          random(1,15),random(1,15));  
  } else if (mousePressed && (mouseButton == LEFT)) {//drum rum
    strokeWeight(3);
  stroke(random(255),random(255),random(255)); //regenbogen
  line (pmouseX, pmouseY, mouseX, mouseY);
}

  

if(keyPressed){
 
    if (key=='e'){          //ellipse
    
    int cs; cs = 15;
    
    if(mouseX>100) cs=5;        //unterschied pmouseX u mouseX
    if(pmouseX>200) cs = 15;    //groesse variieren
    if(pmouseX>300) cs = 25;
    if(pmouseX>400) cs = 35;
    if(pmouseX>500) cs = 45;
  
  noStroke();
  ellipse(mouseX,mouseY,cs,cs);
  }
}

  
  
  
  
  int a; a=50;      //variablen
  
  int b; b=30;
  
  int c; c=a+b;
  
  if(key=='l') {                //strichfarbe ändert sich bei key u mausklick
  strokeWeight(random(1,3));    
  line(mouseX,mouseY+a,        //nach oben, aber leider versetzt zum cursor
       mouseX+random(-a,a),
       mouseY+random(-b,b));
  }
  
  
  // Farbauswahl
  if (key=='r'){    //red
  fill(240,20,20);
  stroke(240,20,20);
  }
  if (key=='g'){    //green
  fill(25,210,10);
  stroke(25,210,10);
  }
  if (key=='b'){    //blue
  fill(10,30,180);
  stroke(10,30,180);
  }
  if (key=='y'){    //yellow
  fill(240,230,15);
  stroke(240,230,15);
  }
  
  if (key=='o'){    //orange
  fill(240,115,15);
  stroke(240,115,15);
  }
  
  if (key=='v'){    //violett
  fill(150,5,150);
  stroke(150,5,150);
  }
  
  if (key=='c'){    //cyan
  fill(15,250,250);
  stroke(15,250,250);
  }
  
  if (key=='m'){    //magenta
  fill(240,0,250);
  stroke(240,0,250);
  }
  
  if (key=='k'){    //key
  fill(0);
  stroke(0);
  }

  if (key=='w'){    //white
  fill(255);
  stroke(255);
  }
  
    
//    fill(255,255,0);
//    stroke(10);
//   
// 
//    fill(random(255),random(255),random(255));
//    ellipse(mouseX,mouseY,cs,cs);

//ellipse(random(width),random(height),random(10,120),10);

  


}


