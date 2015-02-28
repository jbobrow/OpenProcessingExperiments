
class drawAll{
drawPollen pollen1;
drawPollen pollen2;
drawPollen pollen3;
drawPollen pollen4;
drawPollen pollen5;
drawPollen pollen6;
drawPollen pollen7;
drawPollen pollen8;
drawPollen pollen9;
drawPollen pollen10;
drawPollen pollen11;
drawPollen pollen12;
Timer timer1;
Timer timer2;
Timer timer3;
Timer timer4;
Timer timer5;
Timer timer6;
Timer timer7;
Timer timer8;
Timer timer9;
Timer timer10;
Timer timer11;
Timer timer12;
Timer timer0;



/*AudioOutput out1;
AudioOutput out2;
AudioOutput out3;
AudioOutput out4;
AudioOutput out5;
AudioOutput out6;
AudioOutput out7;
AudioOutput out8;
AudioOutput out9;
AudioOutput out10;
AudioOutput out11;
AudioOutput out12;*/
SineWave sine1;
SineWave sine2;
SineWave sine3;
SineWave sine4;
SineWave sine5;
SineWave sine6;
SineWave sine7;
SineWave sine8;
SineWave sine9;
SineWave sine10;
SineWave sine11;
SineWave sine12;

color c1;
color c2;
color c3;
color c4;
color c5;
color c6;
color c7;
color c8;
color c9;
color c10;
color c11;
color c12;
color wht = color (255, 255, 255);
color blk = color (105, 105, 105);

void initialize()
{
  
  pollen1 = new drawPollen (-1, -2, width/4, 0, wht);
  pollen2 = new drawPollen (0, -2, width/2, 0, c2);
  pollen3 = new drawPollen (1, -2, 3*width/4, 0, wht);
  pollen4 = new drawPollen (2, -1, width, height/4, c4);
  pollen5 = new drawPollen (2, 0, width, height/2, wht);
  pollen6 = new drawPollen (2, 1, width, 3*height/4, c6);
  pollen7 = new drawPollen (1, 2, 3*width/4, height, wht);
  pollen8 = new drawPollen (0, 2, width/2, height, c8);
  pollen9 = new drawPollen (-1, 2, width/4, height, wht);
  pollen10 = new drawPollen (-2, 1, 0, 3*height/4, c10);
  pollen11 = new drawPollen (-2, 0, 0, height/2, wht);
  pollen12 = new drawPollen (-2, -1, 0, height/4, c12);
  
  timer1 = new Timer(250);
  timer2 = new Timer(500);
  timer3 = new Timer(750);
  timer4 = new Timer(1000);
  timer5 = new Timer(1250);
  timer6 = new Timer(1500);
  timer7 = new Timer(1750);
  timer8 = new Timer(2000);
  timer9 = new Timer(2250);
  timer10 = new Timer(2500);
  timer11 = new Timer(2750);
  timer12 = new Timer(3000);
  timer0 = new Timer(300);
  
      // get a line out from Minim, default sample rate is 44100, default bit depth is 16
  out = minim.getLineOut(Minim.STEREO, 4096);
  /*out2 = minim.getLineOut(Minim.STEREO, 2048);
  out3 = minim.getLineOut(Minim.STEREO, 2048);
  out4 = minim.getLineOut(Minim.STEREO, 2048);
  out5 = minim.getLineOut(Minim.STEREO, 2048);
  out6 = minim.getLineOut(Minim.STEREO, 2048);
  out7 = minim.getLineOut(Minim.STEREO, 2048);
  out8 = minim.getLineOut(Minim.STEREO, 2048);
  out9 = minim.getLineOut(Minim.STEREO, 2048);
  out10 = minim.getLineOut(Minim.STEREO, 2048);
  out11 = minim.getLineOut(Minim.STEREO, 2048);
  out12 = minim.getLineOut(Minim.STEREO, 2048);*/
  sine1 = new SineWave(2637, 0.5, out.sampleRate());
  sine2 = new SineWave(1976, 0.5, out.sampleRate());
  sine3 = new SineWave(1397, 0.5, out.sampleRate());
  sine4 = new SineWave(1047, 0.5, out.sampleRate());
  sine5 = new SineWave(784, 0.5, out.sampleRate());
  sine6 = new SineWave(587, 0.5, out.sampleRate());
  sine7 = new SineWave(440, 0.5, out.sampleRate());
  sine8 = new SineWave(330, 0.5, out.sampleRate());
  sine9 = new SineWave(247, 0.5, out.sampleRate());
  sine10 = new SineWave(175, 0.5, out.sampleRate());
  sine11 = new SineWave(131, 0.5, out.sampleRate());
  sine12 = new SineWave(98, 0.5, out.sampleRate());
  
   // physics.setIntegrator( ParticleSystem.MODIFIED_EULER ); 
   pollen1.initialize();  
   pollen2.initialize();
   pollen3.initialize();
   pollen4.initialize();
   pollen5.initialize();  
   pollen6.initialize();
   pollen7.initialize();
   pollen8.initialize();
   pollen9.initialize();  
   pollen10.initialize();
   pollen11.initialize();
   pollen12.initialize();
   
   out.addSignal(sine1);
   out.disableSignal(sine1);
   out.addSignal(sine2);
   out.disableSignal(sine2);
   out.addSignal(sine3);
   out.disableSignal(sine3);
   out.addSignal(sine4);
   out.disableSignal(sine4);
   out.addSignal(sine5);
   out.disableSignal(sine5);
   out.addSignal(sine6);
   out.disableSignal(sine6);
   out.addSignal(sine7);
   out.disableSignal(sine7);
   out.addSignal(sine8);
   out.disableSignal(sine8);
   out.addSignal(sine9);
   out.disableSignal(sine9);
   out.addSignal(sine10);
   out.disableSignal(sine10);
   out.addSignal(sine11);
   out.disableSignal(sine11);
   out.addSignal(sine12);
   out.disableSignal(sine12);
  
   
}

void start()
{
  pollen1.start();
  pollen2.start();
  pollen3.start();
  pollen4.start();
  pollen5.start();
  pollen6.start();
  pollen7.start();
  pollen8.start();
  pollen9.start();
  pollen10.start();
  pollen11.start();
  pollen12.start();
  
  if(timer1.isFinished()){
     pollen1.addNode();
     c1= wht;
     out.enableSignal(sine1);  
     if(timer0.isFinished()){
       c1 = blk;
       out.disableSignal(sine1);
       timer0.start();
     }   
     timer1.start();
  }
  if(timer2.isFinished()){       
    pollen2.addNode();
    c2 = wht;
    out.enableSignal(sine2); 
    if(timer0.isFinished()){
      c2 = blk;
      out.disableSignal(sine2);
      timer0.start();
    }
    timer2.start();
  }
  if(timer3.isFinished()){
     pollen3.addNode();
     c3 = wht;
     out.enableSignal(sine3);
     if(timer0.isFinished()){ 
       c3 = blk;
       out.disableSignal(sine3);
       timer0.start();
     }
     timer3.start();
  }
  if(timer4.isFinished()){
     pollen4.addNode();
     c4 = wht;
     out.enableSignal(sine4); 
     if(timer0.isFinished()){
       c4 = blk;
       out.disableSignal(sine4);
       timer0.start();
     }
     timer4.start();
  }
  if(timer5.isFinished()){
     pollen5.addNode();
     c5 = wht;
     out.enableSignal(sine5); 
     if(timer0.isFinished()){
       c5 = blk;
       out.disableSignal(sine5);
       timer0.start();
     }
     timer5.start();
  }
  if(timer6.isFinished()){
     pollen6.addNode();
     c6 = wht;
     out.enableSignal(sine6); 
     if(timer0.isFinished()){
       c6 = blk;
       out.disableSignal(sine6);
       timer1.start();
     }
     timer6.start();
  }
  if(timer7.isFinished()){
     pollen7.addNode();
     c7 = wht;
     out.enableSignal(sine7); 
     if(timer0.isFinished()){
       c7 = blk;
       out.disableSignal(sine7);
       timer0.start();
     }
     timer7.start();
  }
  if(timer8.isFinished()){
     pollen8.addNode();
     c8 = wht;
     out.enableSignal(sine8); 
     if(timer0.isFinished()){
       c8 = blk;
       out.disableSignal(sine8);
       timer0.start();
     }
     timer8.start();
  }
  if(timer9.isFinished()){
     pollen9.addNode();
     c9 = wht;
     out.enableSignal(sine9); 
     if(timer0.isFinished()){
       c9 = blk;
       out.disableSignal(sine9);
       timer0.start();
     }
     timer9.start();
  }
  if(timer10.isFinished()){
     pollen10.addNode();
     c10 = wht;
     out.enableSignal(sine10); 
     if(timer0.isFinished()){
       c10 = blk;
       out.disableSignal(sine10);
       timer0.start();
     }
     timer10.start();
  }
  if(timer11.isFinished()){
     pollen11.addNode();
     c11 = wht;
     out.enableSignal(sine11); 
     if(timer0.isFinished()){
       c11 = blk;
       out.disableSignal(sine11);
       timer0.start();
     }
     timer11.start();
  }
  if(timer12.isFinished()){
     pollen12.addNode();
     c12 = wht;
     out.enableSignal(sine12); 
     if(timer0.isFinished()){
       c12 = blk;
       out.disableSignal(sine12);
       timer0.start();
     }
     timer12.start();
     return;
  }
  }

/*void change()
{
  if(out.isEnabled(sine1)){
   c1 = color (255);}
   if(timer0.isFinished()){
   c1 = color (255, 255, 255, 140);
   timer0.start();
     }
  if(out.isEnabled(sine2)){
  c2 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c2 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine3)){
  c3 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c3 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine4)){
  c4 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c4 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine5)){
  c5 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c5 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine6)){
  c6 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c6 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine7)){
  c7 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c7 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine8)){
  c8 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c8 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine9)){
  c9 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c9 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine10)){
  c10 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c10 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine11)){
  c11 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c11 = color (5, 5, 5, 140);
  timer0.start();
     }
  if(out.isEnabled(sine12)){
  c12 = color (255, 255, 255, 140);}
   if(timer0.isFinished()){
  c12 = color (5, 5, 5, 140);
  timer0.start();
     }
}
}*/




  
void stop()
  {
   out.close();
  /* out2.close();
   out3.close();
   out4.close();
   out5.close();
   out6.close();
   out7.close();
   out8.close();
   out9.close();
   out10.close();
   out11.close();
   out12.close();*/
      
 
  }
  }

