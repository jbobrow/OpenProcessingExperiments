
import saito.objloader.*;

OBJModel model ;

float rotX, rotY;

boolean bMode1 = true;


import ddf.minim.*;

AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;
AudioPlayer player10;
AudioPlayer player11;
AudioPlayer player12;
AudioPlayer player13;
AudioPlayer player14;
AudioPlayer player15;
AudioPlayer player16;
AudioPlayer player17;
AudioPlayer player18;
AudioPlayer player19;
AudioPlayer player20;
AudioPlayer player21;
AudioPlayer player22;
AudioPlayer player23;
AudioPlayer player24;
Minim minim;

PImage img;

void setup()
{
    size(800, 600, P3D);
    frameRate(30);
    
    model = new OBJModel(this, "ranardeak.obj", "absolute", TRIANGLES);
    model.enableDebug();

    model.scale(24);
    model.translateToCenter();

    stroke(255);
    noStroke();
    
    
  minim = new Minim(this);
  player1 = minim.loadFile("1 So.mp3", 2048);
  player2 = minim.loadFile("2 La.mp3", 2048);
  player3 = minim.loadFile("3 Ti.mp3", 2048);
  player4 = minim.loadFile("4 Do.mp3", 2048);
  player5 = minim.loadFile("5 Ra.mp3", 2048);
  player6 = minim.loadFile("6 Mi.mp3", 2048);
  player7 = minim.loadFile("7 Fa.mp3", 2048);
  player8 = minim.loadFile("8 So.mp3", 2048);
  player9 = minim.loadFile("9 La.mp3", 2048);
  player10 = minim.loadFile("10 Ti.mp3", 2048);
  player11 = minim.loadFile("11 Do.mp3", 2048);
  player12 = minim.loadFile("12 Ra.mp3", 2048);
  player13 = minim.loadFile("13 Mi.mp3", 2048);
  player14 = minim.loadFile("14 Fa.mp3", 2048);
  player15 = minim.loadFile("15 So.mp3", 2048);
  player16 = minim.loadFile("16 La.mp3", 2048);
  player17 = minim.loadFile("17 Ti.mp3", 2048);
  player18 = minim.loadFile("18 Do.mp3", 2048);
  player19 = minim.loadFile("19 Ra.mp3", 2048);
  player20 = minim.loadFile("20 Mi.mp3", 2048);
  player21 = minim.loadFile("21 Fa.mp3", 2048);
  player22 = minim.loadFile("22 So.mp3", 2048);
  player23 = minim.loadFile("23 La.mp3", 2048);
  player24 = minim.loadFile("24 Ti.mp3", 2048);
  
  img = loadImage("name.jpg");

}



void draw()
{
    background(129);
    //lights();
    pushMatrix();
    
       if(bMode1)
     {
       rotX -= 0.01;
       rotY = -0.3;
       translate(width/2, height/2, 0);
     } else
     {
       translate(width/2, height/2, 40);
     }
     
    rotateX(rotY);
    rotateY(rotX);

    model.draw();

    popMatrix();
    
   //println(mouseY);
   
    if(bMode1)
    {
   image(img, 200, 0);
    }
}

boolean bTexture = true;
boolean bStroke = false;

void keyPressed()
{
    if(key == 't') {
        if(!bTexture) {
            model.enableTexture();
            bTexture = true;
        } 
        else {
            model.disableTexture();
            bTexture = false;
        }
    }

    if(key == 's') {
        if(!bStroke) {
            stroke(255);
            bStroke = true;
        } 
        else {
            noStroke();
            bStroke = false;
        }
    }

    else if(key=='1')
        model.shapeMode(POINTS);
    else if(key=='2')
        model.shapeMode(LINES);
    else if(key=='3')
        model.shapeMode(TRIANGLES);
}

void mouseDragged()
{
//    rotX += (mouseX - pmouseX) * 0.01;
//    rotY -= (mouseY - pmouseY) * 0.01;
}

void mouseReleased() 
{
 if(bMode1==false)
 {
  if(mouseX>=6&&mouseX<=46&&mouseY>155&&mouseY<445)
  {
    player1.rewind();
    player1.play();
  }else if(mouseX>=47&&mouseX<=86&&mouseY>155&&mouseY<445)
  {
    player2.rewind();
    player2.play();
  }else if(mouseX>=87&&mouseX<=124&&mouseY>155&&mouseY<445)
  {
    player3.rewind();
    player3.play();
  }else if(mouseX>=125&&mouseX<=160&&mouseY>155&&mouseY<445)
  {
    player4.rewind();
    player4.play();
  }else if(mouseX>=161&&mouseX<=195&&mouseY>155&&mouseY<445)
  {
    player5.rewind();
    player5.play();
  }else if(mouseX>=196&&mouseX<=226&&mouseY>155&&mouseY<445)
  {
    player6.rewind();
    player6.play();
  }else if(mouseX>=227&&mouseX<=258&&mouseY>155&&mouseY<445)
  {
    player7.rewind();
    player7.play();
  }else if(mouseX>=259&&mouseX<=289&&mouseY>155&&mouseY<445)
  {
    player8.rewind();
    player8.play();
  }else if(mouseX>=290&&mouseX<=318&&mouseY>155&&mouseY<445)
  {
    player9.rewind();
    player9.play();
  }else if(mouseX>=319&&mouseX<=346&&mouseY>155&&mouseY<445)
  {
    player10.rewind();
    player10.play();
  }else if(mouseX>=347&&mouseX<=375&&mouseY>155&&mouseY<445)
  {
    player11.rewind();
    player11.play();
  }else if(mouseX>=375&&mouseX<=402&&mouseY>155&&mouseY<445)
  {
    player12.rewind();
    player12.play();
  }else if(mouseX>=403&&mouseX<=430&&mouseY>155&&mouseY<445)
  {
    player13.rewind();
    player13.play();
  }else if(mouseX>=431&&mouseX<=459&&mouseY>155&&mouseY<445)
  {
    player14.rewind();
    player14.play();
  }else if(mouseX>=460&&mouseX<=487&&mouseY>155&&mouseY<445)
  {
    player15.rewind();
    player15.play();
  }else if(mouseX>=488&&mouseX<=516&&mouseY>155&&mouseY<445)
  {
    player16.rewind();
    player16.play();
  }else if(mouseX>=517&&mouseX<=546&&mouseY>155&&mouseY<445)
  {
    player17.rewind();
    player17.play();
  }else if(mouseX>=547&&mouseX<=578&&mouseY>155&&mouseY<445)
  {
    player18.rewind();
    player18.play();
  }else if(mouseX>=579&&mouseX<=610&&mouseY>155&&mouseY<445)
  {
    player19.rewind();
    player19.play();
  }else if(mouseX>=611&&mouseX<=643&&mouseY>155&&mouseY<445)
  {
    player20.rewind();
    player20.play();
  }else if(mouseX>=644&&mouseX<=678&&mouseY>155&&mouseY<445)
  {
    player21.rewind();
    player21.play();
  }else if(mouseX>=679&&mouseX<=715&&mouseY>155&&mouseY<445)
  {
    player22.rewind();
    player22.play();
  }else if(mouseX>=716&&mouseX<=754&&mouseY>155&&mouseY<445)
  {
    player23.rewind();
    player23.play();
  }else if(mouseX>=755&&mouseX<=791&&mouseY>155&&mouseY<445)
  {
    player24.rewind();
    player24.play();
  }else
  {
      bMode1 =!bMode1;
    rotX = 0;
    rotY = 0;
  }
  
 }else
  {
     bMode1 =!bMode1;
    rotX = -3.13999948;
    rotY = -1.5699991;
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player1.close();
  player2.close();
  player3.close();
  player4.close();
  player5.close();
  player6.close();
  player7.close();
  player8.close();
  player9.close();
  player10.close();
  player11.close();
  player12.close();
  player13.close();
  player14.close();
  player15.close();
  player16.close();
  player17.close();
  player18.close();
  player19.close();
  player20.close();
  player21.close();
  player22.close();
  player23.close();
  player24.close();
  minim.stop();
  
  super.stop();
}

/*
import ddf.minim.*;

AudioPlayer player;
AudioPlayer player2;
Minim minim;

void setup()
{
  size(512, 200, P2D);

  minim = new Minim(this);
  
  // load a file, give the AudioPlayer buffers that are 1024 samples long
  // player = minim.loadFile("groove.mp3");
  
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("1 So.mp3", 2048);
  player2 = minim.loadFile("2 La.mp3", 2048);
  // play the file
  player.play();
  player2.play();
}

void draw()
{
  background(0);
  stroke(255);
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for(int i = 0; i < player.left.size()-1; i++)
  {
    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    line(i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  
  super.stop();
}*/


