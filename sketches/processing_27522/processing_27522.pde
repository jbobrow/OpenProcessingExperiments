

import ddf.minim.*;
PFont font;

Minim minim;
AudioSnippet a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;
float LLx=.4, LLy=1, txtSiz=.5, txtClr=40, kcX, kcY, kcTXT=1;


void setup () {
  size (1000,700);
  smooth ();
  background (0);
  font = loadFont ("ArialMT-20.vlw");
  textFont (font);
  

  
  minim = new Minim (this);
  
  a= minim.loadSnippet ("loopyBerlin1.wav");
  b= minim.loadSnippet ("kottos AMB1.wav");
  c= minim.loadSnippet ("loopAMB.wav");
  d= minim.loadSnippet ("loopAMB2.wav");
  e= minim.loadSnippet ("loopy8.wav");
  f= minim.loadSnippet ("loopy9.wav");
  g= minim.loadSnippet ("loopGLITSCHb.wav");
  h= minim.loadSnippet ("loopyWarum2.wav");
  i= minim.loadSnippet ("faction AMB1.wav");
  j= minim.loadSnippet ("loopy7.wav");
  k= minim.loadSnippet ("mir3.wav");
  l= minim.loadSnippet ("mod3 3.wav");
  m= minim.loadSnippet ("mod3 91.wav");
  n= minim.loadSnippet ("mod3 93 zu.wav");
  t= minim.loadSnippet ("mod3 94 1.wav");
  p= minim.loadSnippet ("mod6 2.wav");
  q= minim.loadSnippet ("mod6 zu.wav");
  r= minim.loadSnippet ("prep2 1.wav");
  s= minim.loadSnippet ("ZZZZ.wav");
  o= minim.loadSnippet ("loopGLITSCH.wav");
  u= minim.loadSnippet ("twerk BASSBEATloop1.wav");
  v= minim.loadSnippet ("twerk BT1.wav");
  w= minim.loadSnippet ("faction AMB2.wav");
  x= minim.loadSnippet ("mod6 bzzz.wav");
  y= minim.loadSnippet ("zu 4.wav");
  z= minim.loadSnippet ("SHH HEY.wav");

}


  void draw () {
  }
  
  void keyPressed () {
 
  txtSiz=txtSiz+2;
  LLx=LLx+2;
  LLy=LLy+3;
  kcTXT=kcTXT+1;

   if (kcTXT >=10) {
   txtSiz=txtSiz-txtSiz+10;
  }
  if (LLx>= 666) {
    LLx=1;
  }
  if (LLy>=888) {
    LLy=1;
  }
   
    if (key == 'a' ) {
      a.play (0);
      textSize (txtSiz);
      text ("can", LLx+80,LLy+20);
    }
      if (key == 'b' ) {
      b.play (0);
      textSize (txtSiz);
      text ("can", LLx+80,LLy+20);
    }
    
    if (key == 'c' ) {
      c.play (0);
      textSize (txtSiz);
      text ("you", LLx+160,LLy+20);
    }
    if (key == 'd' ) {
      d.play (0);
      textSize (txtSiz);
      text ("you", LLx+460, LLy+20);
    }
     if (key == 'e' ) {
      e.play (0);
      textSize (txtSiz*2);
      text ("hear", LLx+240,LLy+20);
     }
     if (key == 'f' ) {
      f.play (0);
      textSize (txtSiz*2);
      text ("see", LLx+520,LLy+20);
    }
    
    
    if (key == 'g' ) {
      g.play (0);
      g.loop (2);
      textSize (txtSiz);
      text ("me", LLx+320,LLy+20);
    }
      if (key == 'h' ) {
      h.play (0);
      textSize (txtSiz);
      text ("me", LLx+600,LLy+20);
    }
   
     if (key == 'i' ) {
      i.play (0);
      textSize (txtSiz*2);
      text ("there", LLx+50,LLy+100);
     }
     if (key == 'j' ) {
      j.play (0);
      textSize (txtSiz*2);
      text ("too", LLx+200,LLy+100);
     }
     if (key == 'k' ) {
      k.play (0);
      textSize (txtSiz*2);
      text ("there", LLx+400,LLy+100);
     }
     
      if (key == 'l' ) {
      l.play (0);
      textSize (txtSiz*2);
      text ("too", LLx+550,LLy+100);
    }
    
     if (key == 'm' ) {
      m.play (0);
      textSize (txtSiz*2);
      text ("are", LLx+150,LLy+100);
     }
     if (key == 'n' ) {
      n.play (0);
      textSize (txtSiz*2);
      text ("many", LLx+230,LLy+100);
     }
     if (key == 'o' ) {
      o.play (0);
      textSize (txtSiz*2);
       text ("are", LLx+500,LLy+100);
     }
     if (key == 'p' ) {
      p.play (0);
      textSize (txtSiz*2);
      text ("many", LLx+600,LLy+100);
    }
   
    if (key == 'q' ) {
      q.play (0);
      q.loop (2);
      textSize (txtSiz+10);
      text ("signs", LLx+290,LLy+100);
    }
     if (key == 'r' ) {
      r.play (0);
      textSize (txtSiz+10);
      text ("sounds", LLx+680,LLy+100); 
    }
   
    if (key == 's' ) {
      s.play (0);
      textSize (txtSiz);
      text ("there", LLx+150,LLy+200);
    }
    
    if (key == 't' ) {
      t.play (0);
      textSize (txtSiz);
      text ("is", LLx+220,LLy+200);
    }
   
      if (key == 'u' ) {
      u.play (0);
      u.loop (2);
      textSize (txtSiz*2);
      text ("barely", LLx+280,LLy+200);
    }
       if (key == 'v' ) {
      v.play (0);
      v.loop (2);
      textSize (txtSiz*2);
      text ("any", LLx+370,LLy+200);
    }
      if (key == 'w' ) {
      w.play (0);
      w.loop (2);
      textSize (txtSiz*2);
      text ("meaning", LLx+470,LLy+200);
      
    }
     ////////////////////////////
     
       if (key == 'x' ) {
      x.play (0);
      x.loop (2);
      textSize (txtSiz*2);
      text ("never",LLx+400,680-LLy);
      text ("never",LLx+100,LLy+20);
      
    }
      if (key == 'y' ) {
      y.play (0);
      y.loop (2);
      textSize (txtSiz*2);
      text ("enough",LLx+480,680-LLy);
      text ("enough",LLx+180,LLy+20);
      
    }
       if (key == 'z' ) {
      z.play (0);
      z.loop (2);
      textSize (txtSiz*3);
      text ("space",LLx+ 560,680-LLy);
      text ("time",LLx+180,LLy+20);
      
    }
    
    if (key == ' ' ) {
      z.play (0);
      background (0);
      a.pause();
      b.pause();
      c.pause();
      d.pause();
      e.pause();
      f.pause();
      g.pause();
      h.pause();
      i.pause();
      j.pause();
      k.pause();
      l.pause();
      m.pause();
      n.pause();
      o.pause();
      p.pause();
      q.pause();
      r.pause();
      s.pause();
      t.pause();
      u.pause();
      v.pause();
      w.pause();
      x.pause();
      y.pause();
      v.pause();
      z.pause();
   }
  }

  
   void stop () {
     a.close ();
     b.close ();
     c.close ();
     d.close ();
     e.close ();
     f.close ();
     g.close ();
     h.close ();
     i.close ();
     j.close ();
     k.close ();
     l.close ();
     m.close ();
     n.close ();
     o.close ();
     p.close ();
     q.close ();
     r.close ();
     s.close ();
     t.close ();
     u.close ();
     v.close ();
     w.close ();
     x.close ();
     y.close ();
     z.close ();
     minim.stop ();
     super.stop ();
   }
   
  

