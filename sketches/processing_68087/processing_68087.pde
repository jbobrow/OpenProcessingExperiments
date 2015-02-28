
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65030*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//You should provide the text below when attributing this sketch:

//"Loading_3D_OBJ_Model" by archana, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
//Work: http://openprocessing.org/visuals/?visualID= 65030 
//License: 
//http://creativecommons.org/licenses/by-sa/3.0/
//http://creativecommons.org/licenses/GPL/2.0/
import codeanticode.glgraphics.*;

//import processing.opengl.*;
//import javax.media.opengl.*;
import saito.objloader.*;

// declare that we need a OBJModel and we'll be calling it "model"
OBJModel model;

float rotX;
float rotY;
PImage tex;
// these booleans will be used to turn on and off bits of the OBJModel
boolean bTexture = true;
boolean bStroke = false;
boolean bMaterial = false;

void setup()
{
    size(500, 500, P3D);
  
    // making an object called "model" that is a new instance of OBJModel
    model = new OBJModel(this,"blueflatfront.obj", "relative", POLYGON);
   
    // turning on the debug output (it's all the stuff that spews out in the black box down the bottom)
    model.enableDebug();
    model.translateToCenter();
    model.scale(80);
    model.printModelInfo();
    noStroke();
}

void draw()
{
    background(255);
    lights();

    //this will do nothing until the model material is turned off
  //  fill(255,0,255);

    pushMatrix();
    translate(width/2, height/2, 0);
    rotateX(rotY);
    rotateY(rotX);
    model.draw();
    popMatrix();
}



void keyPressed() {
    // turns on and off the texture listed in .mtl file
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

    else if(key == 'm') {
        // turns on and off the material listed in .mtl file
        if(!bMaterial) {
            model.enableMaterial();
            bMaterial = true;
        } 
        else {
            model.disableMaterial();
            bMaterial = false;
        }
    }

    else if(key == 's') {
        if(!bStroke) {
            stroke(10, 10, 10);
            bStroke = true;
        } 
        else {
            noStroke();
            bStroke = false;
        }
    }

    // the follwing changes the render modes
    // POINTS mode is a little flakey in OPENGL (known processing bug)
    // the best one to use is the one you exported the obj as
    // when in doubt try TRIANGLES or POLYGON
    else if(key=='1') {
        stroke(10, 10, 10);
        bStroke = true;
        model.shapeMode(POINTS);
    }

    else if(key=='2') {
        stroke(10, 10, 10);
        bStroke = true;
        model.shapeMode(LINES);
    }

    else if(key=='3') {
        model.shapeMode(TRIANGLES);
    }

    else if(key=='4') {
        model.shapeMode(POLYGON);
    }

    else if(key=='5') {
        model.shapeMode(TRIANGLE_STRIP);
    }

    else if(key=='6') {
        model.shapeMode(QUADS);
    }

    else if(key=='7') {
        model.shapeMode(QUAD_STRIP);
    }
}
void mouseDragged()
{
    rotX += (mouseX - pmouseX) * 0.01;
    rotY -= (mouseY - pmouseY) * 0.01;
}


