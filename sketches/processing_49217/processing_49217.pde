
import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;

import org.apache.commons.logging.impl.*;
import org.apache.commons.logging.*;

import codigodelaimagen.cuadriculas.*;
import codigodelaimagen.base_tmp.*;
import codigodelaimagen.forum.*;
import codigodelaimagen.cuadriculas.model.*;
import codigodelaimagen.base.*;
import codigodelaimagen.cuadriculas.calculos.*;
import codigodelaimagen.cuadriculas.interfaces.*;


import toxi.color.*;
import toxi.color.theory.*;
ReticulaRet reticulaRet;
void setup(){
  colorMode(HSB,100);
  size(800,800);
  rect(100,100,100,100);
   reticulaRet = new ReticulaRet("foros.xml",20, 0, width - 20, height, this);
}

void draw(){
  		reticulaRet.display();

}
 void mouseClicked() {
		reticulaRet.raton(mouseX, mouseY);
	}


