
/**
sKeTch is audiovisual application

Aris Bezas Sat, 16 July 2011, 17:31

SC-CODE
=======
s.boot;
(
SynthDef("Xaraktiki", 
            { arg  amp = 0.5, pan = 0, out = 0;
                var source;
      02*i);
  }
}

void draw()  {
  myLine();
  noFeY);
    line2.render(255,255,255, 0);
     }
    strokeL = strokeValue;
  }


  noFill(); 
  drawline();

}


void drawline(){
    fxMouse = mouseX;
  ];// move it
    yar)  {
   // OscMessage s27 Igoumenin0, colorR, cat[stoixeia]    stoixeia = stoixeiaVar;
  YVar)  {
    pointX = pointXVar;
 40,0,1.6  );
//   i] *= elastikotita[i];
      epitaxinsiX[i] += deltaX[i];
      epitaxinsiY[i] += deltaY[i];
      x[i] += epitaxinsiX[i];// move it
      y[i] += epitaxinsiY[i];
      epitaxinsiX[i] *= aposvesi[i];    // slow down elastikotita
      epitaxinsiY[i] *= aposvesi[i];
    }
  }
  void calcPointsStart(float pointXVar, float pointYVar)  {
    pointX = pointXVar;
    pointY = pointYVar;
    for (int i=0; i<stoixeia; i++){
      x[i] = mouseX;
      y[i] = mouseY;
    }
  }


  void render(int colorRVar, int colorGVar, int colorBVar, int lineAlphaVar)  {
    colorR = colorRVar;
    colorG = colorGVar;
    colorB = colorBVar;    
    lineAlpha = lineAlphaVar;    
    noFill();
    stroke(colorR, colorG, colorB, lineAlpha);
    beginShape();
    for (int i = 0; i < stoixeia; i++)  {
      curveVertex(x[i], y[i]);
    }
    endShape();
  }

}                                                                                               
