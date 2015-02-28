
/*

ERAZZOR KEYBOARD by Jaap Steilberg

Use mouse or keys:

 2 3   5 6 7   9 0
Q W E R T Y U I O P

 S D   G H J
Z X C V B N M

key L reloads sound

Sound from lmms.sourceforge.net
Minim-emulation code by Daniel Hodgin

*/

//            012345678901234567890123456789012
String scale="zxcvbnmqwertyuiopsd-ghj-23-567-90";
//            C                CIS             EOS

final int border=32, bkgrd=222;
final int CIS=17, EOS=33;
final int kbdY=566;        // top of keyboard

boolean xy[][]=new boolean[EOS][600];
int keydown[]=new int[EOS];

int cursor=0, paw=-1;
int flashCounter;
int pressed=0;
//__________________________________________________________________

void setup()
  {
    size(744, 744, P2D);
    frameRate(60);
    smooth();
    background(bkgrd);
    minim=new Minim(this);
    loadAllSound();
  }
//__________________________________________________________________

void colorNote(int note)
  {
    int mod7;

    noStroke();
    if (note==-1) fill(0);
    else if (note<CIS)
      {
        mod7=note%7+1;        // 1...7
        fill(((mod7 & 2)>>1)*180, ((mod7 & 4)>>2)*180, ((mod7 & 1)>>0)*180);
      }
    else
      {
        mod7=(note-CIS)%7+1;
        fill(((mod7 & 2)>>1)*255, ((mod7 & 4)>>2)*255, ((mod7 & 1)>>0)*255);
      }
  }
//__________________________________________________________________

void draw()
  {
    int y, j, xball, valX, offX;
    int note;
    background(bkgrd);

        fill(0);
        rect(border/2, border/2, width-border, height-border);

        if (pressed) xy[paw][0]=1;
        for (y=590; y>=0; y--)
          {
            for (note=0; note<EOS; note++)
              {
                for (j=17; j>5; j--)        //  j makes tail
                  {
                    if (xy[note][y]==1)
                      {
                        colorNote(note);
                        int xVal=note<CIS ? 32+note*40+20 : 32+(note-CIS)*40+40;
                        if (485-y+10*j>35)        // still moving
                            ellipse(xVal, 485-y+10*j, 1000/j/j, 1000/j/j+j/2);
                        else
                          {
                            if (note>=CIS) ellipse(xVal, 20+y/8-48, y/4-96, y/4-96);        // blow sharps
                            else ellipse(xVal, 35, 28, 28);        // hang at ceiling
                          }
                        fill(255);
                        if (y<10 && j==6)
                            ellipse(xVal, 485-y+10*j, 38-2*y, 38-2*y);        // flash
                      }
                  }
                xy[note][y+2]=xy[note][y];        // move the note
                xy[note][y]=0;
              }
          }

    fill(bkgrd);
    rect(0, 0, width, border/2);

    // KEYBOARD
    stroke(0);
    for (j=0; j<17; j++)        // draw white keys
      {
        fill(255);
        if (keydown[j]>0 || (mousePressed && j==paw))
            rect(border+j*40+1, kbdY+1, 40-2, 150-2);        // pressed key
        else
            rect(border+j*40, kbdY, 40, 150);
      }
    for (j=0; j<17; j++)        // draw black keys
      {
        if (j%7==2 || j%7==6) continue;        //  no EIS or BIS

        if (keydown[j+CIS] || (mousePressed && j==paw-CIS)) fill(150);        // pressed key
        else fill(1);        // mouse looks for color(1)

        if (j%7==0 || j%7==3) offX=-4;        //  CIS  FIS
        else if (j%7==1 || j%7==5) offX=4;        //  ES  BES
        else offX=0;
        rect(border+j*40+28+offX, kbdY, 24, 90);
      }
    pressed=0;
    noStroke();
  }
//__________________________________________________________________

void playNote(int pNote)
  {
    sound=minim.loadFile("erazzor"+pNote+".mp3");
    sound.play();
    flashCounter=0;
    pressed=1;
  }
//__________________________________________________________________

void loadAllSound()
  {
    for (int i=0; i<EOS; i++)
      {
        if (scale.charCodeAt(i)=='-') continue;
        sound=minim.loadFile("erazzor"+i+".mp3");
      }
  }
//__________________________________________________________________

void mousePressed()
  {
    if (mouseY<kbdY || mouseY>kbdY+150 || mouseX<border || mouseX>border+17*40)
      {paw=-1; return;}

    if (get(mouseX, mouseY)==color(1))        // sharps have fill(1)
        paw=(int)((mouseX-20-border)/40)+CIS;
    else
        paw=(int)((mouseX-border)/40);        // white key

    playNote(paw);
  }
//__________________________________________________________________

int whatKey()
  {
    int i;
    for (i=0; i<EOS; i++)
      {
        if (scale.charCodeAt(i)==key) return i;        // use charAt in PDE
      }
    return -1;
  }
//__________________________________________________________________

void keyPressed()
  {
    int mykey;

    if (key=='l') loadAllSound();
    else        // kbd playing
      {
        mykey=whatKey();
        if (mykey==-1) return;  // don't jitter

        if (keydown[mykey]==0)
          {
            paw=mykey;
            keydown[mykey]=1;
            playNote(paw);
          }
      }
  }
//__________________________________________________________________

void keyReleased()
  {
    int mykey=whatKey();
    if (mykey==-1) return;
    keydown[mykey]=0;
  }

//__________________________________________________________________
//__________________________________________________________________


// Minim-emulation code by Daniel Hodgin

// wrap the P5 Minim sound library classes
function Minim()
  {
    this.loadFile=function(str)
      {
        return new AudioPlayer(str);
      }
  }

// Browser Audio API
function AudioPlayer(str)
  {
    var loaded=false;
    var looping=false;
    if (!!document.createElement('audio').canPlayType)
      {
        var audio=document.createElement('audio');
        audio.addEventListener('ended', function()
          {
            if (looping)
              {
                this.currentTime=0;
                this.play();
              }
          }, false);
        audio.preload='auto';
        audio.autobuffer=true;
        if (canPlayOgg())
          {
            audio.src=str.replace(".mp3", ".ogg");
          }
        else if (canPlayMp3())
          {
            audio.src=str;
          }
        loaded=true;
      }

    this.play=function()
      {
        if (!loaded)
          {
            var local=this;
            setTimeout(function()
              {
                local.play();
              }, 50);
            return;
          }
        audio.play();
      };

    this.loop=function()
      {
        if (!loaded)
          {
            var local=this;
            setTimeout(function()
              {
                local.loop();
              }, 50);
            return;
          }
        //audio.loop = 'loop';
        looping=true;
        audio.play();
      };

    this.pause=function()
      {
        if (!loaded)
          {
            return;
          }
        audio.pause();
      };

    // rewind the sound to start
    this.rewind=function()
      {
        if (!loaded)
          {
            return;
          }
        if (audio.currentTime)
          {
            audio.currentTime=0;
          }
      };

    this.position=function()
      {
        if (!loaded)
          {
            return -1;
          }
        if (audio.currentTime)
          {
            return audio.currentTime*1000;
          }
        return -1;
      };

    this.cue=function(position)
      {
        if (!loaded)
          {
            return;
          }
        if (audio.currentTime)
          {
            audio.currentTime=position/1000;
          }
      };

    this.mute=function()
      {
        audio.volume=0.0;
      };

    this.unmute=function()
      {
        audio.volume=1.0;
      };
  }

function canPlayOgg()
  {
    var a=document.createElement('audio');
    return !!(a.canPlayType && a.canPlayType('audio/ogg; codecs="vorbis"').replace(/no/, ''));
  }

function canPlayMp3()
  {
    var a=document.createElement('audio');
    return !!(a.canPlayType && a.canPlayType('audio/mpeg;').replace(/no/, ''));
  }

// ****



