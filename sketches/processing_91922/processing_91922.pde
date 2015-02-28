
void setup() {
   size(700,500);
   bor = 100;
   lpan = bor;
   rpan = width-bor;
   wpan = rpan-lpan;
   tpan = bor;
   bpan = height-bor;
   hpan = bpan-tpan;
   ltl = lpan-5;
   rtl = width-5;
   btl = bpan+bor/4;
   
   px = 1000;
   py = 5;
   y0 = bpan-10*py;
   y10 = y0-10*py;
   y20 = y0-20*py;
   y30 = y0-30*py;
   y40 = y0-40*py;

   // Constants: 
   Omega = 2*PI/86400;
   cd = 1e-3;
   ch = cd;
   cp = 1e3;
   rho = 1.0;
   h = 2e3;
   p0 = 50.0;
   rmax = 500e3;
   
   // Tickbox initial values and positions:
   friction = false;
   vrmaxmove = false;
   updraft = false;
   up2 = false;
   up3 = false;
   downdraft = false;
   displayPar = 'v';
   
   frictionx = lpan+270;
   frictiony = height-bor/3;
   updraftx = lpan+400;
   updrafty = frictiony;
   up2x = updraftx;
   up2y = updrafty+20;
   up3x = updraftx;
   up3y = updrafty-20;
   downdraftx = lpan+550;
   downdrafty = frictiony; 
   
   parvx = lpan+50; 
   parvy = frictiony; 
   parux = parvx; 
   paruy = parvy-20; 
   parMx = parvx+40; 
   parMy = parvy; 
   parwx = parvx; 
   parwy = parvy+20;
   parAx = parvx+40; 
   parAy = parvy+20; 
   parpx = parvx+40; 
   parpy = parvy-20; 
   parTx = parvx+80; 
   parTy = parvy; 
   
   // Pointer initial values and positions:
   lat = 70.0;
   r0 = 200.0e3;
   vrmax = 0;
   rew1 = 80e3;
   rew2 = rew1+20e3;
   Ts = 10;
   Trmax = -10;
   
   laty = bpan-lat*hpan/90;
   latx = width-bor/3;
   r0x = lpan+r0/px;
   r0y = y0+10;
   vrmaxx = rpan+10;
   vrmaxy = y0;
   rew1x = lpan+rew1/px;
   rew2x = lpan+rew2/px;
   rewy = tpan-10;
   Tsx = bor/2+10;
   Tsy = y0-Ts*py;
   Trmaxx = rpan+10;
   Trmaxy = y0-Trmax*py;
   weyex = rew2x+10;
   
   // Fonts: 
   font = createFont("serif",20);
   font_cursive = createFont("cursive",20);
   font_sans = createFont("sans-serif",20);
   font_mono = createFont("monospace",20);
 }
 
// Keyboard switches ----------------------------------------------
  void keyPressed() {
    if (key == 'p') {
      save("thepl.tif");
    }
   else if (friction && displayPar == 'v' && key == 'v') {
     vrmaxmove = true;
     downdraft = false;
   }
   else if (key == 'V') {
     vrmaxmove = false;
   }
  }
  
 void writeTitle() {
   fs = 50;
   textFont(font,fs);
   fill(0);
   textAlign(CENTER,CENTER);   
   text("A theorethical polar low",width/2,bor/2);
 }
 
 void drawGrid(int llim,int tlim,int rlim, int blim,int nxt,int nyt) {
   background(255);
   strokeWeight(1);
   fill(255);
   stroke(0);
   rectMode(CORNERS);
   rect(llim,tlim,rlim,blim);

   // Lines ----------------
   line(lpan,y10,rpan,y10);
   line(lpan,y20,rpan,y20);
   line(lpan,y30,rpan,y30);
   line(lpan,y40,rpan,y40);
   line(lpan+100,tpan,lpan+100,bpan);
   line(lpan+200,tpan,lpan+200,bpan);
   line(lpan+300,tpan,lpan+300,bpan);
   line(lpan+400,tpan,lpan+400,bpan);
   strokeWeight(2);
   line(lpan,y0,rpan,y0);

   // Tick labels -------
   fs = 20;
   textFont(font,fs);
   fill(0);
   
   textAlign(CENTER);
   text("0",lpan,btl);
   text("100",lpan+100,btl);
   text("200",lpan+200,btl);
   text("300",lpan+300,btl);
   text("400",lpan+400,btl);
   text("500",rpan,btl);

   textAlign(RIGHT,CENTER);
   if (displayPar == 'u') {
     text("10",ltl,bpan);
     text("0",ltl,y0);
     text("-10",ltl,y10);
     text("-20",ltl,y20);
     text("-30",ltl,y30);
     text("-40",ltl,y40);
     text("-50",ltl,tpan);
     py = 5;
   }
   else if (displayPar == 'A') {
     text("200",ltl,bpan);
     text("0",ltl,y0);
     text("-200",ltl,y10);
     text("-400",ltl,y20);
     text("-600",ltl,y30);
     text("-800",ltl,y40);
     text("-1000",ltl,tpan);
     py = 2.5;
   }
   else {
     text("-10",ltl,bpan);
     text("0",ltl,y0);
     text("10",ltl,y10);
     text("20",ltl,y20);
     text("30",ltl,y30);
     text("40",ltl,y40);
     text("50",ltl,tpan);
     py = 5;
   }
   
   text("0",rtl,bpan);
   text("15",rtl,y0);
   text("30",rtl,y10);
   text("45",rtl,y20);
   text("60",rtl,y30);
   text("75",rtl,y40);
   text("90",rtl,tpan);

   // Axis Labels ------------
   textAlign(CENTER);
   text("Radius (km)",width/2,bpan+bor/2);
   rotate(-PI/2);
   if (displayPar=='u') {
     text("Radial velocity (dm/s)",-height/2,bor/3);
   }
   else if (displayPar=='v') {
     text("Azimuthal velocity (m/s)",-height/2,bor/3);
   }
   else if (displayPar=='w') {
     text("Vertical velocity (cm/s)",-height/2,bor/3);
   }
   else if (displayPar=='p') {
     text("Relative pressure (hPa)",-height/2,bor/3);
   }
   else if (displayPar=='M') {
     text("Angular momentum (km²/s)",-height/2,bor/3);
   }
   else if (displayPar=='A') {
     text("Scaled volume flow (km³/s)",-height/2,bor/3);
   }
   else if (displayPar=='T') {
     text("Air temperatrure (°C)",-height/2,bor/3);
   }
   text("Latitude (°)",-height/2,rpan+bor/2);
   rotate(PI/2);
  
 }

 void tickBox(String boxText, String boxFont, int posX, int posY, string textPos, boolean boxVar) {
   fill(255);
   strokeWeight(1);
   rectMode(CENTER);
   rect(posX,posY,10,10);
   fill(0);
   textFont(boxFont);
   if (textPos == "left") {
     textAlign(RIGHT,CENTER);
     text(boxText,posX-10,posY);
   }
   else if (textPos=="right") {
     textAlign(LEFT,CENTER);
     text(boxText,posX+10,posY);
   }
   if (boxVar) {
     textFont(font_sans,fs);
     textAlign(CENTER,CENTER);
     text("x",posX,posY);
   }
 }

// Tickboxes ------------------------------------------------------
  void drawBoxes() {
    fs = 20;
    textFont(font,fs);
    fill(0);
    strokeWeight(1);
    textAlign(RIGHT,CENTER);
    text("Display:",parvx-10,parvy);
    tickBox("v",font_cursive,parvx,parvy,"right",displayPar=='v');
    tickBox("M",font_cursive,parMx,parMy,"right",displayPar=='M');
    tickBox("Friction:",font,frictionx,frictiony,"left",friction);
    if (friction) {
      tickBox("u",font_cursive,parux,paruy,"right",displayPar=='u');
      tickBox("p",font_cursive,parpx,parpy,"right",displayPar=='p');
      tickBox("A",font_cursive,parAx,parAy,"right",displayPar=='A');
      tickBox("T",font_cursive,parTx,parTy,"right",displayPar=='T');
      tickBox("Updraft:",font,updraftx,updrafty,"left",updraft);
    }
    if (updraft) {
      tickBox("w",font_cursive,parwx,parwy,"right",displayPar=='w');
      tickBox("up2:",font,up2x,up2y,"left",up2);
      tickBox("up3:",font,up3x,up3y,"left",up3);
      tickBox("Downdraft:",font,downdraftx,downdrafty,"left",downdraft);
    }
  }
  
 boolean tickingBox(int posX, int posY, boolean boxVar) {
   if (abs(mouseX-posX)<5 && abs(mouseY-posY)<5) {
     if (boxVar == false) {
       boxVar = true;
     }
     else if (boxVar==true) {
       boxVar = false;
     }
   }
   return boxVar;
 }

// Ticking boxes -----------------------------------------
  // Case --------------
 void mouseClicked() { 
   friction = tickingBox(frictionx,frictiony,friction);
   if (friction) {
     updraft = tickingBox(updraftx,updrafty,updraft);
     if (updraft) {
       up2 = tickingBox(up2x,up2y,up2);
       if (up2) {
         up3 = false;
       }
       up3 = tickingBox(up3x,up3y,up3);
       if (up3) {
         up2 = false;
       }
       downdraft = tickingBox(downdraftx,downdrafty,downdraft);
       if (downdraft) {
         vrmaxmove = false;
       }
     }
     else {
       downdraft = false;
     }
   }
   else {
     updraft = false;
     vrmaxmove = false;
     downdraft = false;
   }

  // Display parameter ------
   if (abs(mouseX-parux)<5 && abs(mouseY-paruy)<5) {
     displayPar = 'u';
   }
   else if (abs(mouseX-parvx)<5 && abs(mouseY-parvy)<5) {
     displayPar = 'v';
   }
   else if (updraft && abs(mouseX-parwx)<5 && abs(mouseY-parwy)<5) {
     displayPar = 'w';
   }
   else if (abs(mouseX-parpx)<5 && abs(mouseY-parpy)<5) {
     displayPar = 'p';
   }
   else if (abs(mouseX-parMx)<5 && abs(mouseY-parMy)<5) {
     displayPar = 'M';
   }
   else if (abs(mouseX-parAx)<5 && abs(mouseY-parAy)<5) {
     displayPar = 'A';
   }
   else if (abs(mouseX-parTx)<5 && abs(mouseY-parTy)<5) {
     displayPar = 'T';
   }
 }

// Main loop ***************************************************
 void draw() {
// Writing title and drawing grid -----------------------------
   drawGrid(lpan,tpan,rpan,bpan);
   drawBoxes();
   writeTitle();
   
// Calculations -----------------------------------------------
   // Some parameters --
   f = 2*sin(lat*PI/180)*Omega;
   M = 0.5*f*r0*r0;
   A = -sqrt(M*M*M*exp(1)/f);

   // Asymptotes and frictionless --
   if (!friction) {
     strokeWeight(3);
   }
   else {
     strokeWeight(1);
   }
   for (int i = lpan; i < rpan; i++) {
     r = (i-lpan)*px;
     v1 = M/r -0.5*f*r;
     MM = M*1e-6;
     if (displayPar=='v' && v1>=-10 && v1<=50) {
       point(i,y0-v1*py);
     }
     else if (displayPar=='M' && MM>=-10 && MM<=50) {
       point(i,y0-MM*py);
     }
     v2 = sqrt(f*abs(A)/r);
     MM = (v2*r +f*r*r/2)*1e-6;
     if (friction && !downdraft && displayPar=='v' && v2>=-10 && v2<=50) {
       point(i,y0-v2*py);
     }
     else if (friction && !downdraft && displayPar=='M' && MM>=-10 && MM<=50) {
       point(i,y0-MM*py);
     }
   }
   
   // Full solution with friction --
   if (vrmaxmove) {
     v = vrmax;
   }
   else if (downdraft) {
     v = 0;
   }
   else {
     v = v2;
   }
   p = p0;
   T = Trmax-Ts;
   T2 = Trmax-Ts;
   if (friction) {
     if (up2 || up3) {
       rew1 = 0;
       rew1x = lpan;
     }
     up3go = false;
     for (int i = rpan; i > lpan; i--) {
       r = (i-lpan)*px;
       if (updraft && !up3 && r <= rew1) {     // in eye
         dAdr = 0;
         AA = 0;
         v = 0;
         w = 0;
       }
       else if (updraft && r <= rew2) {        // in eye-wall
         k = v/(r+px);
         rpx = r+px;
         if ((up3 && AA>=-k*k*rpx*rpx*rpx/(2*k+f)) || up3go) {
           if (!up3go) {
             rew1 = r;
             rew1x = lpan+rew1/px;
           }
           up3go = true;
           v -= k*px;
           AA = -k*k*r*r*r/(2*k+f);
           dAdr = -3*k*k*r*r/(2*k+f);
           w = -dAdr*cd/r*100;
         }
         else if (up2 || up3) {
             w = weye;
             dAdr = -w/100*r/cd;
             AA -= dAdr*px;
             dvdr = -v/r -f -r*abs(v)*v/AA;
             v -= dvdr*px;
             if (AA>0) {
               w = 0;
               dAdr = -w/100*r/cd;
               AA = 0;
               v = 0;
               rew1 = r;
               rew1x = lpan+rew1/px;
             }
         }
         else {
           w = -dAdr*cd/r*100;
           dAdr = A/(rew2-rew1);
           AA = dAdr*(r-rew1);
           aew = PI*(rew2*rew2-rew1*rew1);
           weye = -A*2*PI*cd/aew*100;
           weyey = y0-weye*py;
           dvdr = -v/r -f -r*abs(v)*v/AA;
           v -= dvdr*px;
         }
       }
       else {                                   // outside eye-wall
         if (downdraft) {
           dAdr = -A/(501e3-rew2);
           AA = dAdr*(r-501e3);
         }
         else {
           dAdr = 0;
           AA = A;
         }
         dvdr = -v/r -f -r*abs(v)*v/AA;
         v -= dvdr*px;
         w = -dAdr*cd/r*100;
       }
       MM = (v*r +f*r*r/2)*1e-6;
       AAA = -AA*1e-10;
       u = -AA*cd/(r*h);
       dudr = (dAdr*cd/h +u)/r;
       dpdr = rho*(u*dudr +v*(v/r +f) -cd/h*abs(u)*u)/100;
       p -= dpdr*px;
       U = sqrt(u*u+v*v);
       v2 = sqrt(f*abs(A)/r);
       dT2dr = sqrt(f*r/abs(A))*T2;
       T2 -= dT2dr*px;
       if (AA != 0) {
         dTdr = -r/AA*U*T;
         T -= dTdr*px;
       }
       else {
         T = 0;
       }
       strokeWeight(3);
       if (displayPar=='u' && u*10>=-10 && u*10<=50) {
         point(i,y0-u*10*py);
       }
       else if (displayPar=='v' && v>=-10 && v<=50) {
         point(i,y0-v*py);
       }
       else if (displayPar=='w' && w>=-10 && w<=50) {
         point(i,y0-w*py);
       }
       else if (displayPar=='p' && p>=-10 && p<=50) {
         point(i,y0-p*py);
       }
       else if (displayPar=='M' && MM>=-10 && MM<=50) {
         point(i,y0-MM*py);
       }
       else if (displayPar=='A' && AAA>=-50/py && AAA<=250/py) {
         point(i,y0-AAA*py);
       }
       else if (displayPar=='T' && (Ts+T)>=-10 && (Ts+T)<=50) {
         point(i,y0-(Ts+T)*py);
         strokeWeight(1);
         point(i,y0-(Ts+T2)*py);
       }
     }
   }

// Drawing pointers -----------------------------------------------------
   strokeWeight(3);
   triangle(r0x-2, r0y+10, r0x+2, r0y+10, r0x, r0y);
   triangle(latx-10, laty-2, latx-10, laty+2, latx, laty);
   if (displayPar == 'v' && vrmaxmove) {
     triangle(vrmaxx+10, vrmaxy-2, vrmaxx+10, vrmaxy+2, vrmaxx, vrmaxy);
   }
   if (displayPar == 'w' && updraft && up2) {
     triangle(weyex+10, weyey-2, weyex+10, weyey+2, weyex, weyey);
   }
   if (displayPar == 'T') {
     triangle(Tsx-10, Tsy-2, Tsx-10, Tsy+2, Tsx, Tsy);
     strokeWeight(1);
     line(lpan,Tsy,rpan,Tsy);
     strokeWeight(3);
     triangle(Trmaxx+10, Trmaxy-2, Trmaxx+10, Trmaxy+2, Trmaxx, Trmaxy);
   }
   if (updraft) {
     if (up2 || up3) {
       if (rew1 > 0) {
         fill(255);
       }
       ellipse(rew1x, rewy, 15, 15);
       fill(0);
     }
     else if (!up3) {
       triangle(rew1x-2, rewy-10, rew1x+2, rewy-10, rew1x, rewy);
     }
     triangle(rew2x-2, rewy-10, rew2x+2, rewy-10, rew2x, rewy);
     strokeWeight(1);
     line(rew1x,tpan,rew1x,bpan);
     line(rew2x,tpan,rew2x,bpan);
   }
     
   
// Moving pointers ----------------------------------------------
   if (mousePressed && mouseY>y0 && mouseY<=bpan && mouseX>=lpan && mouseX<=rpan) {
     r0 = (mouseX-lpan)*px;
     r0x = mouseX;
   }
   else if (mousePressed && mouseY>=tpan && mouseY<=bpan && mouseX>width-bor/2) {
     lat = (bpan-mouseY)*90/hpan;
     laty = mouseY;
   }
   else if (updraft && mousePressed && mouseY<tpan && mouseY>bor/2 && mouseX>=lpan && mouseX<=rpan) {
     rew0 = (mouseX-lpan)*px;
     rew = (rew1+rew2)/2;
     if (rew0<rew && !up2) {
       rew1 = rew0;
       rew1x = mouseX;
     }
     else {
       rew2 = rew0;
       rew2x = mouseX;
       weyex = rew2x+10;
     }
   }
   else if (vrmaxmove && mousePressed && mouseY>=tpan && mouseY<=bpan && mouseX>rpan && mouseX<width-bor/2) {
     vrmax = (y0-mouseY)*60/hpan;
     vrmaxy = mouseY;
   }
   else if (displayPar=='w' && up2 && mousePressed && mouseY>=tpan && mouseY<=bpan && mouseX>lpan && mouseX<rew2x+bor/2) {
     weye = (y0-mouseY)*60/hpan;
     weyey = mouseY;
   }
   else if (displayPar=='T' && mousePressed && mouseY>=tpan && mouseY<=bpan && mouseX>bor/2 && mouseX<lpan) {
     Ts = (y0-mouseY)*60/hpan;
     Tsy = mouseY;
   }
   else if (displayPar=='T' && mousePressed && mouseY>=tpan && mouseY<=bpan && mouseX>rpan && mouseX<width-bor/2) {
     Trmax = (y0-mouseY)*60/hpan;
     Trmaxy = mouseY;
   }
   
 }


