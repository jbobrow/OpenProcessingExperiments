
  void ButtonsChk(){
  
      //check if the BLANK button is pressed
      if (inside (5, 70, 35, 100)) {
        if (BW==false) {

          background(0, 0, 255);
        }
        if (BW==true) {
          background(150, 50, 100);
          ;
        }
      }

      //Drpr button
      if (inside(717, 70, 747, 100)) {
        Drpr=true;
        Modo=1;
      }


      //check if LISTEN button is pressed
      if (inside(width-120, height-40, width-60, height-10)) {
        Modo = 1;
      }  
      
      //check if AUTO button is pressed
      if (inside(650, height-40, 670, height-10)) {
       Auto = true;
      }

      //check if Mouse button is pressed
      if (inside(630, height-40, 649, height-10)) {
       Auto = false;
      }

      //Check if Inv button
      if (inside(width-48, height/2-20, width-33, height/2+20)) {
      Inv=true;
      noFill();
      stroke(255);
      rect(width-65, height/2-22, 19, 44);
      }

      //Check if Inv2 button
      if (inside(width-63, height/2-20, width-48, height/2+20)) {         
        Inv=false;
       }

      //check if BW button is pressed
      if (inside(240, height-40, 255, height-10)) {
        background(150, 50, 100);
        drawSat = 0;
        BW=true;
      }

      //check if C button is pressed
      if (inside(265, height-40, 280, height-10)) {
        background(0, 0, 255);
        BW=false;
      }

      //check if HueSlider is clicked
      if (inside(ColOff, 0, width-65, 19)) {
        drawSat = 255;
        drawBri = 255;
        Huepik();
      }
            //check if OCTAVE is clicked
      if (inside(width-30, 20, width-5, height-20)) {
octave();
//println(Octave);
      }
      
      //check if PenSize is clicked
      if (inside(335, 565, 500,585)) {
Pensize();
      }
      
       //color selector
      if (BW==false) {

          if (Inv==false) {
            for (n=0;n<13;n++) {

              if (inside(ColOff+n*ColSpacing, 20, 40+ColOff+n*ColSpacing, 65)) {

                if (mouseButton==LEFT) {
                  huePik = colors[12-n];
                  drawSat=255;
                  drawBri=255;
                }
                else {
                  background(colors[12-n], 255, 255);
                }
              }
            }
          }
          if (Inv==true) {
            for (v=0;v<13;v++) {

              if (inside(ColOff+v*ColSpacing, 20, 40+ColOff+n*ColSpacing, 65)) {

                if (mouseButton==LEFT) {
                  huePik = colorsV[v];
                  drawSat=255;
                  drawBri=255;
                }
                else {
                  background(colorsV[v], 255, 255);
                }
              }
            }
          }
        }
      
      if (BW==true) {
         if (Inv==false) {
            for (n=0;n<13;n++) {

              if (inside(ColOff+n*ColSpacing, 20, 40+ColOff+n*ColSpacing, 65)) {

                if (mouseButton==LEFT) {
                  huePik = colors[12-n];

                 // println  ("Pik" + Pik);
                  drawSat=0;
                  drawBri=huePik;
                }
                else {
                  background(0, 0, colors[12-n]);
                }
              }
            }
          }

          if (Inv==true) {
            for (v=0;v<13;v++) {

              if (inside(ColOff+v*ColSpacing, 20, 40+ColOff+n*ColSpacing, 65)) {

                if (mouseButton==LEFT) {
                  huePik = colorsV[v];

                  drawSat=0;
                  drawBri=huePik;
                }
                else {
                  background(0, 0, colorsV[v]);
                }
              }
            }
          }
      }
    }

