
//this sketch was created as an example for the IMA 
//by Joseph Aaron Campbell
//josephaaroncampbell.com
//it uses OBJLoader and the SAITO example as a base

import saito.objloader.*;

OBJModel model ;

float rotX, rotY;

void setup()
{
    size(640, 480, P3D);
    frameRate(30);
    ///keep your poly count 32000 and below for obj files
    //or youre going to have a bad time
    //create and load instance of model
    model = new OBJModel(this, "vase.obj", "absolute", TRIANGLES);
    model.enableDebug();
    //scale of model. not sure the relationship to original size
    model.scale(125);
    model.translateToCenter();
    stroke(255);
    noStroke();
}



void draw()
{
   //what color is your background? 0=black, 255=white
    background(25);
    //add some info about model and origins
    String s = "Original Vase found at: Http://www.imamuseum.org/art/collections/artwork/abstract-vessel-black  Artist: Odundo, Magdalene";
    fill(200, 200, 200);
    text(s, 15, 20, 450, 50);
    
    //retrieve mouse cordinates for later use
    //adds directional light to position of mouse
    float dirY = (mouseY / float(height) - 0.5) * 2;
    float dirX = (mouseX / float(width) - 0.5) * 2;
   
    //Lights
    //directionalLight(204, 204, 204, -dirX, -dirY, -1);
    ambientLight(255, 200, 200,300,200,-1);
    lightSpecular(255, 255, 255); 
    shininess(10.0);
    spotLight(225, 225, 225,0,0,0, -1, 0, 0, 0, 0);
    directionalLight(145,145,145, 300, 200, 10);
 
   //pushMatrix and popMatrix create little bubble for model to be in
    pushMatrix();//begin changes to model
    translate(width/2, height/2, 0);
    rotateX(rotY*0.4);
    rotateY(rotX*0.4);
    model.draw();
    popMatrix();//end changes to model
    
    
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
    rotX += (mouseX - pmouseX) * 0.01;
    rotY -= (mouseY - pmouseY) * 0.01;
}


