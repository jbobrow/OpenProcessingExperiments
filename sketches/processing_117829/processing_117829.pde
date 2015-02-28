
// HUI Wang Chuen 53077809
// CMS3 Coding for Interactivity
// Mini Project

// An interactive game for children traning intensive visual and audio literacy. 
// This game is acutually developed from my assignment 4 and I think it is a double sensory training for children,
// while childrn moving the mouse (only mouse as I try to use touchscreen, effect will not come),
// they can see different color schemes and build up congnition of learning colour, meanwhile,
// a multiple-audio can be received by children, including musical instruments like
// piano, violin, triangle, harp, guitar, flute, saxophone, glockenspiel, recorder, harmonica, tambourine.
// Therefore, an educational function with sensory training and entertainment are included in the game and
// this is the reason why I use this for the mini project.

// Instrucion : press UP to restart the game and press DOWN to create some no-filled color boxes

//coding for reference :
//Examples in the week 4 & 5 lecture notes, especially the MINIM LIBRARY part and text part like Code wk5_exercise_01
//http://processing.org/reference/mouseClicked_.html
//http://processing.org/reference/rect_.html
//http://www.learningprocessing.com/examples/chapter-5/example-5-3/
//http://processing.org/reference/keyPressed_.html



//audio credits:
//the allowing audio files I used are all from :
//http://www.daimi.au.dk/~jones/dsp/sounds/singlenote/Piano.ff.F3.wav
//http://cd.textfiles.com/mmplus/MEDIA/WAV/EFFECTS/BP_JZZPN.WAV
//http://appsrv.cse.cuhk.edu.hk/~wmszeto/dafx05/DU1-M3-72-V70_79-V70-1-est.wav
//http://www.eborg2.com/Sounds/Sounds-Dark/PianoNote.wav
//http://appsrv.cse.cuhk.edu.hk/~wmszeto/cmmr05/DU1-M3-36-V70_43-V70-1-est1.wav
//http://nhttp://www.vibrationdata.com/Petrov_D.mp3
//http://appsrv.cse.cuhk.edu.hk/~wmszeto/dafx05/DU1-M3-80-V70_84-V70-1-res.wav
//http://appsrv.cse.cuhk.edu.hk/~wmszeto/dafx05/DU1-M3-72-V70_76-V70-1-org.wav
//http://www.vibrationdata.com/piano_C_sharp.mp3
//http://www.sounds.beachware.com/2illionzayp3may/rlfivhyk/KBD01.mp3
//http://www.muvig.de/01keysounds/violin02.mp3
//http://www.daimi.au.dk/~jones/dsp/sounds/singlenote/Violin.pizz.D4.wav
//http://iem.at/~zmoelnig/pd/download/patches/PhaseLockedVocoder/violine.wav
//http://cs.nyu.edu/~wew201/multimedia/hw1/triangle.wav
//http://tipiwiki.free.fr/snd/Triangle.wav
//http://www.music.mcgill.ca/~gary/307/sounds/triangle.wav
//http://fuv.hivolda.no/prosjekt/aakregry/Lyd/triangel3sek.wav
//http://www.denhaku.com/r_box/sr16/sr16perc/triangle.wav
//http://www.mediarare.com/M_sounds/RingLing.wav
//http://tiki.oneworld.net/sustain/quizzes/verygood.wav
//http://www.modular-planet.de/instruments/harp/Harp523.mp3
//http://newmail.monsterserve.com/keepout/misc/harp[1].wav
//http://www.acoustics.hut.fi/publications/papers/jaes-ssm/dsbe18b.wav
//http://www.sounds.beachware.com/2illionzayp3may/puzaytua/HARPINIC.mp3
//http://www.acoustics.hut.fi/publications/papers/jaes-ssm/dsbe18bflat.wav
//http://www.acoustics.hut.fi/publications/papers/jaes-ssm/ds.wav
//http://www10.plala.or.jp/taniuchi/index.htm/harp.wav
//http://library.thinkquest.org/16098/ea/lessons/audio/opentune.wav
//http://moodle.uca.es/mod/chat/beep.wav
//http://library.thinkquest.org/16098/ea/lessons/audio/6e_open.wav
//http://www2.engr.arizona.edu/~429rns/audiofiles/A440Hz.wav
//http://soundcavern.free.fr/guitar/Acoustic_Guitar_Chords%20-%20Cmaj.wav
//http://two.leasingnews.org/SoundBits/Music/STLGUITR.WAV
//http://www.beatmode.com/free-loops/ohm-boyz/mp3/bass-n-ohm-140-3.mp3
//http://har-bal.com/reference/Lutes%20&%20Guitars/gsshrt.wav
//http://www.timetrek.org/6SS/5TH.WAV
//http://www.daimi.au.dk/~jones/dsp/sounds/singlenote/flute.novib.ff.B4.wav
//http://www.kuni-net.com/oto2.wav
//http://peabody.sapp.org/class/350.868/lab/sms/flute-c5-sines.wav
//http://work.colum.edu/~nlinscheid/sound-library/flute/Flute-breathy/Flute-breathy-G5.wav
//http://www.daimi.au.dk/~jones/dsp/sounds/singlenote/flute.novib.ff.G4.wav
//http://www.kuni-net.com/oto72.wav
//http://www.sax.idv.tw/vibrato/b.wav
//http://www.kawai.co.jp/emi/template/SAX.wav
//http://noel.feld.cvut.cz/vyu/asi/data/data-sounds/saxofon.wav
//http://org.ntnu.no/bonanza/mustek/oving2/torbjou/sax.wav
//http://www.sax.idv.tw/vibrato/2s.wav
//http://www.acc.umu.se/~snow/ljud/sax.wav
//http://cd.textfiles.com/sbsw/BEEPCHMS/SAX.WAV
//http://www.weblust.com/sounds/sax4.wav
//http://www.colorado.edu/physics/phys4830/phys4830_fa01/sounds/nash1.wav
//http://www.sax.idv.tw/vibrato/2p.wav
//http://personal.tsss.edu.hk/erw/Instrument/ASSETS/PAGES/GLOCK/h.mp3
//http://personal.tsss.edu.hk/erw/Instrument/ASSETS/PAGES/GLOCK/l.mp3
//http://www.soundjay.com/misc/whistle-flute-2.wav
//http://www.soundjay.com/misc/whistle-flute-1.wav
//http://www.soundjay.com/misc/sounds/whistle-flute-1.mp3
//http://tipiwiki.free.fr/mus/HarmonicaSimple.wav
//http://www.modular-planet.de/instruments/harmonica/Harmonica1046.mp3
//http://www.patmissin.com/tunings/et-567.mp3
//http://www.patmissin.com/ffaq/squeal2.wav
//http://www.patmissin.com/ffaq/1-rattle.wav
//http://mlsp.cs.cmu.edu/courses/fall2010/class3/d.wav
//http://ugastro.berkeley.edu/~phiggins/idl_decal/harmonicafork.wav
//http://www.muppetlabs.com/~breadbox/software/tworld/wav/tada.wav
//http://mlsp.cs.cmu.edu/courses/fall2010/class3/b.wav
//http://mlsp.cs.cmu.edu/courses/fall2010/class3/e.wav
//http://www.electrongate.com/dmxfiles/drumtraks/SCI_PERC1B.wav
//http://electrongate.com/dmxfiles/STIK_B.WAV
//http://www.denhaku.com/r_box/tr707/tamb.wav
//http://emmanuelprot.free.fr/Drums%20kit%20Manu/Tambourine.wav
//http://www.denhaku.com/r_box/drumtraks/tamb.wav
//http://webusers.siba.fi/~maruippo/audio/sounds/percussion/Perc%20B06.wav
//http://machines.hyperreal.org/machines/manufacturers/Sequential/Drumtraks/samples/tmp/Drumtraks/DT_Tamborine.wav
//http://www.denhaku.com/r_box/linn/tamb.wav
//http://gamelay.usami.com/~netboy/w30/samples/01_roland_mc-303/wavs/Tambouri.wav
//http://fuv.hivolda.no/prosjekt/aakregry/Lyd/tamburin.wav

PFont fonts; // Declare the font class
float P,colorR,colorG,colorB,alpha; // set P, RGB and alpha as floating value
import ddf.minim.*; // declare that audio is impotred
Minim minim;
AudioSample special1,special2,special3,special4,special5,special6,special7,special8,special9, // declare that those audio is inserted into the sketch
            special10,special11,special12,special13,special14,special15,special16,special17,special18,special19,
            special20,special21,special22,special23,special24,special25,special26,special27,special28,special29,
            special30,special31,special32,special33,special34,special35,special36,special37,special38,special39,
            special40,special41,special42,special43,special44,special45,special46,special47,special48,special49,
            special50,special51,special52,special53,special54,special55,special56,special57,special58,special59,
            special60,special61,special62,special63,special64,special65,special66,special67,special68;          
            


void setup (){
 size (600,600); // the size of display window
 background (255); // color of background
 fonts = createFont("Helvetica", 8 ); // Assign that textfont is Helvetica and the size is 8
 textFont (fonts); // function of textfonts
 minim = new Minim (this) ; 
 special1 = minim.loadSample("Piano.mp3"); // Inserting the audio
 special2 = minim.loadSample("BP_JZZPN.mp3");
 special3 = minim.loadSample("DU1_M3_60_V70_84_V70_1_res.mp3");
 special4 = minim.loadSample("DU1_M3_72_V70_76_V70_1_org.mp3");
 special5 = minim.loadSample("g_piano2.mp3");
 special6 = minim.loadSample("Petrov_D.mp3");
 special7 = minim.loadSample("piano (2).mp3");
 special8 = minim.loadSample("PianoNote.mp3");
 special9 = minim.loadSample("piano_C_sharp.mp3");
 special10 = minim.loadSample("KBD01.mp3");
 special11 = minim.loadSample("violin02.mp3"); 
 special12 = minim.loadSample("Violin.pizz.D4.mp3");
 special13 = minim.loadSample("violine.mp3");
 special14 = minim.loadSample("RingLing.mp3");
 special15 = minim.loadSample("triangel3sek.mp3");
 special16 = minim.loadSample("triangle (1).mp3");
 special17 = minim.loadSample("triangle (2).mp3");
 special18 = minim.loadSample("triangle.mp3");
 special19 = minim.loadSample("Harp523.mp3");
 special20 = minim.loadSample("harp.mp3");
 special21 = minim.loadSample("HARPINIC.mp3"); 
 special22 = minim.loadSample("dsbe18b.mp3");
 special23 = minim.loadSample("violine.mp3");
 special24 = minim.loadSample("Triangle (3).mp3");
 special25 = minim.loadSample("dsbe18bflat.mp3");
 special26 = minim.loadSample("harp.mp3");
 special27 = minim.loadSample("harp[1].mp3");
 special28 = minim.loadSample("verygood.mp3");
 special29 = minim.loadSample("bass-n-ohm-140-3.mp3");
 special30 = minim.loadSample("5TH.mp3");
 special31 = minim.loadSample("6e_open (1).mp3"); 
 special32 = minim.loadSample("6e_open.mp3");
 special33 = minim.loadSample("A440Hz.mp3");
 special34 = minim.loadSample("Acoustic_Guitar_Chords - Cmaj.mp3");
 special35 = minim.loadSample("beep.mp3");
 special36 = minim.loadSample("opentune.mp3");
 special37 = minim.loadSample("STLGUITR.mp3");
 special38 = minim.loadSample("flute.novib.ff.B4.mp3");
 special39 = minim.loadSample("flute.novib.ff.G4.mp3");
 special40 = minim.loadSample("Flute-breathy-G5.mp3");
 special41 = minim.loadSample("flute-c5-sines.mp3"); 
 special42 = minim.loadSample("oto2.mp3");
 special43 = minim.loadSample("oto72.mp3");
 special44 = minim.loadSample("2s.mp3");
 special45 = minim.loadSample("b.mp3");
 special46 = minim.loadSample("nash1.mp3");
 special47 = minim.loadSample("sax (1).mp3");
 special48 = minim.loadSample("sax (2).mp3");
 special49 = minim.loadSample("sax4.mp3");
 special50 = minim.loadSample("saxofon.mp3");
 special51 = minim.loadSample("h.mp3"); 
 special52 = minim.loadSample("l.mp3");
 special53 = minim.loadSample("whistle-flute-1.mp3");
 special54 = minim.loadSample("whistle-flute-2.mp3");
 special55 = minim.loadSample("2p.mp3");
 special56 = minim.loadSample("Harmonica1046.mp3");
 special57 = minim.loadSample("et-567.mp3");
 special58 = minim.loadSample("1-rattle.mp3");
 special59 = minim.loadSample("d.mp3");
 special60 = minim.loadSample("e.mp3");
 special61 = minim.loadSample("harmonicafork.mp3"); 
 special62 = minim.loadSample("HarmonicaSimple.mp3");
 special63 = minim.loadSample("squeal2.mp3");
 special64 = minim.loadSample("tada.mp3");
 special65 = minim.loadSample("Perc B06.mp3");
 special66 = minim.loadSample("Tambouri.mp3");
 special67 = minim.loadSample("Tambourine.mp3");
 special68 = minim.loadSample("tamburin.mp3");  
 
 smooth (); // make the stroke smoother
 }


void draw (){
 text ("Press UP to restart ", 520, 595); // content of text and its position
 P = random (10); // random value of stroke weight
 colorR = random (255); // set value of random digits
 colorG = random (255); 
 colorB = random (255); 
 alpha = random (255); 
 stroke  (colorR,colorG,colorB,alpha); // random color of stroke
 strokeWeight (P); // the thickness of stroke
}

 
 void mouseMoved()  // use mouse effect to create rects in different position and different auido can be received in specific position
 {   // 0-20 
 if (0 < mouseX && mouseX < 20 && 0 < mouseY && mouseY <20 )
 {special1.trigger (); rect (0,0,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 20 < mouseY && mouseY <40 )
 {special56.trigger (); rect (0,20,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 40 < mouseY && mouseY <60 )
 {special60.trigger (); rect (0,40,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 60 < mouseY && mouseY <80 )
 {special14.trigger (); rect (0,60,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 80 < mouseY && mouseY <100 )
 {special17.trigger (); rect (0,80,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 100 < mouseY && mouseY <120 )
 {special37.trigger (); rect (0,100,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 120 < mouseY && mouseY <140 )
 {special3.trigger (); rect (0,120,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 140 < mouseY && mouseY <160 )
 {special56.trigger (); rect (0,140,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 160 < mouseY && mouseY <180 )
 {special25.trigger (); rect (0,160,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 180 < mouseY && mouseY <200 )
 {special33.trigger (); rect (0,180,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 200 < mouseY && mouseY <220 )
 {special5.trigger (); rect (0,200,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 220 < mouseY && mouseY <240 )
 {special14.trigger (); rect (0,220,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 240 < mouseY && mouseY <260 )
 {special15.trigger (); rect (0,240,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 260 < mouseY && mouseY <280 )
 {special18.trigger (); rect (0,260,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 280 < mouseY && mouseY <300 )
 {special64.trigger (); rect (0,280,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 300 < mouseY && mouseY <320 )
 {special12.trigger (); rect (0,300,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 320 < mouseY && mouseY <340 )
 {special36.trigger (); rect (0,320,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 340 < mouseY && mouseY <360 )
 {special33.trigger (); rect (0,340,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 360 < mouseY && mouseY <380 )
 {special44.trigger (); rect (0,360,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 380 < mouseY && mouseY <400 )
 {special55.trigger (); rect (0,380,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 400 < mouseY && mouseY <420 )
 {special66.trigger (); rect (0,400,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 420 < mouseY && mouseY <440 )
 {special51.trigger (); rect (0,420,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 440 < mouseY && mouseY <460 )
 {special33.trigger (); rect (0,440,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 460 < mouseY && mouseY <480 )
 {special26.trigger (); rect (0,460,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 480 < mouseY && mouseY <500 )
 {special17.trigger (); rect (0,480,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 500 < mouseY && mouseY <520 )
 {special27.trigger (); rect (0,500,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 520 < mouseY && mouseY <540 )
 {special41.trigger (); rect (0,520,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 540 < mouseY && mouseY <560 )
 {special47.trigger (); rect (0,540,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 560 < mouseY && mouseY <580 )
 {special8.trigger (); rect (0,560,20,20); fill (0);}
 else if (0 < mouseX && mouseX <20 && 580 < mouseY && mouseY <800 )
 {special9.trigger (); rect (0,580,20,20); fill (0);}

// 20-40 
 if (20 < mouseX && mouseX < 40 && 0 < mouseY && mouseY <20 )
 {special11.trigger (); rect (20,0,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 20 < mouseY && mouseY <40 )
 {special45.trigger (); rect (20,20,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 40 < mouseY && mouseY <60 )
 {special42.trigger (); rect (20,40,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 60 < mouseY && mouseY <80 )
 {special48.trigger (); rect (20,60,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 80 < mouseY && mouseY <100 )
 {special49.trigger (); rect (20,80,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 100 < mouseY && mouseY <120 )
 {special21.trigger (); rect (20,100,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 120 < mouseY && mouseY <140 )
 {special5.trigger (); rect (20,120,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 140 < mouseY && mouseY <160 )
 {special9.trigger (); rect (20,140,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 160 < mouseY && mouseY <180 )
 {special68.trigger (); rect (20,160,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 180 < mouseY && mouseY <200 )
 {special58.trigger (); rect (20,180,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 200 < mouseY && mouseY <220 )
 {special48.trigger (); rect (20,200,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 220 < mouseY && mouseY <240 )
 {special32.trigger (); rect (20,220,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 240 < mouseY && mouseY <260 )
 {special23.trigger (); rect (20,240,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 260 < mouseY && mouseY <280 )
 {special44.trigger (); rect (20,260,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 280 < mouseY && mouseY <300 )
 {special55.trigger (); rect (20,280,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 300 < mouseY && mouseY <320 )
 {special65.trigger (); rect (20,300,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 320 < mouseY && mouseY <340 )
 {special1.trigger (); rect (20,320,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 340 < mouseY && mouseY <360 )
 {special2.trigger (); rect (20,340,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 360 < mouseY && mouseY <380 )
 {special11.trigger (); rect (20,360,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 380 < mouseY && mouseY <400 )
 {special22.trigger (); rect (20,380,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 400 < mouseY && mouseY <420 )
 {special33.trigger (); rect (20,400,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 420 < mouseY && mouseY <440 )
 {special44.trigger (); rect (20,420,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 440 < mouseY && mouseY <460 )
 {special55.trigger (); rect (20,440,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 460 < mouseY && mouseY <480 )
 {special66.trigger (); rect (20,460,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 480 < mouseY && mouseY <500 )
 {special12.trigger (); rect (20,480,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 500 < mouseY && mouseY <520 )
 {special22.trigger (); rect (20,500,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 520 < mouseY && mouseY <540 )
 {special32.trigger (); rect (20,520,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 540 < mouseY && mouseY <560 )
 {special42.trigger (); rect (20,540,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 560 < mouseY && mouseY <580 )
 {special52.trigger (); rect (20,560,20,20); fill (0);}
 else if (20 < mouseX && mouseX <40 && 580 < mouseY && mouseY <800 )
 {special62.trigger (); rect (20,580,20,20); fill (0);}

 // 40-60 
 if (40 < mouseX && mouseX < 60 && 0 < mouseY && mouseY <20 )
 {special13.trigger (); rect (40,0,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 20 < mouseY && mouseY <40 )
 {special23.trigger (); rect (40,20,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 40 < mouseY && mouseY <60 )
 {special33.trigger (); rect (40,40,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 60 < mouseY && mouseY <80 )
 {special43.trigger (); rect (40,60,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 80 < mouseY && mouseY <100 )
 {special53.trigger (); rect (40,80,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 100 < mouseY && mouseY <120 )
 {special63.trigger (); rect (40,100,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 120 < mouseY && mouseY <140 )
 {special4.trigger (); rect (40,120,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 140 < mouseY && mouseY <160 )
 {special14.trigger (); rect (40,140,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 160 < mouseY && mouseY <180 )
 {special24.trigger (); rect (40,160,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 180 < mouseY && mouseY <200 )
 {special34.trigger (); rect (40,180,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 200 < mouseY && mouseY <220 )
 {special44.trigger (); rect (40,200,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 220 < mouseY && mouseY <240 )
 {special54.trigger (); rect (40,220,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 240 < mouseY && mouseY <260 )
 {special64.trigger (); rect (40,240,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 260 < mouseY && mouseY <280 )
 {special5.trigger (); rect (40,260,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 280 < mouseY && mouseY <300 )
 {special15.trigger (); rect (40,280,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 300 < mouseY && mouseY <320 )
 {special25.trigger (); rect (40,300,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 320 < mouseY && mouseY <340 )
 {special35.trigger (); rect (40,320,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 340 < mouseY && mouseY <360 )
 {special45.trigger (); rect (40,340,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 360 < mouseY && mouseY <380 )
 {special55.trigger (); rect (40,360,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 380 < mouseY && mouseY <400 )
 {special65.trigger (); rect (40,380,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 400 < mouseY && mouseY <420 )
 {special6.trigger (); rect (40,400,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 420 < mouseY && mouseY <440 )
 {special16.trigger (); rect (40,420,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 440 < mouseY && mouseY <460 )
 {special26.trigger (); rect (40,440,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 460 < mouseY && mouseY <480 )
 {special36.trigger (); rect (40,460,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 480 < mouseY && mouseY <500 )
 {special46.trigger (); rect (40,480,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 500 < mouseY && mouseY <520 )
 {special56.trigger (); rect (40,500,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 520 < mouseY && mouseY <540 )
 {special66.trigger (); rect (40,520,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 540 < mouseY && mouseY <560 )
 {special7.trigger (); rect (40,540,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 560 < mouseY && mouseY <580 )
 {special17.trigger (); rect (40,560,20,20); fill (0);}
 else if (40 < mouseX && mouseX <60 && 580 < mouseY && mouseY <600 )
 {special27.trigger (); rect (40,580,20,20); fill (0);}
 
 //60-80
 if (60 < mouseX && mouseX < 80 && 0 < mouseY && mouseY <20 )
 {special37.trigger (); rect (60,0,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 20 < mouseY && mouseY <40 )
 {special47.trigger (); rect (60,20,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 40 < mouseY && mouseY <60 )
 {special57.trigger (); rect (60,40,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 60 < mouseY && mouseY <80 )
 {special67.trigger (); rect (60,60,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 80 < mouseY && mouseY <100 )
 {special8.trigger (); rect (60,80,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 100 < mouseY && mouseY <120 )
 {special18.trigger (); rect (60,100,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 120 < mouseY && mouseY <140 )
 {special28.trigger (); rect (60,120,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 140 < mouseY && mouseY <160 )
 {special38.trigger (); rect (60,140,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 160 < mouseY && mouseY <180 )
 {special48.trigger (); rect (60,160,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 180 < mouseY && mouseY <200 )
 {special58.trigger (); rect (60,180,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 200 < mouseY && mouseY <220 )
 {special68.trigger (); rect (60,200,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 220 < mouseY && mouseY <240 )
 {special9.trigger (); rect (60,220,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 240 < mouseY && mouseY <260 )
 {special19.trigger (); rect (60,240,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 260 < mouseY && mouseY <280 )
 {special29.trigger (); rect (60,260,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 280 < mouseY && mouseY <300 )
 {special39.trigger (); rect (60,280,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 300 < mouseY && mouseY <320 )
 {special49.trigger (); rect (60,300,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 320 < mouseY && mouseY <340 )
 {special59.trigger (); rect (60,320,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 340 < mouseY && mouseY <360 )
 {special1.trigger (); rect (60,340,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 360 < mouseY && mouseY <380 )
 {special10.trigger (); rect (60,360,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 380 < mouseY && mouseY <400 )
 {special20.trigger (); rect (60,380,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 400 < mouseY && mouseY <420 )
 {special30.trigger (); rect (60,400,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 420 < mouseY && mouseY <440 )
 {special40.trigger (); rect (60,420,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 440 < mouseY && mouseY <460 )
 {special50.trigger (); rect (60,440,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 460 < mouseY && mouseY <480 )
 {special60.trigger (); rect (60,460,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 480 < mouseY && mouseY <500 )
 {special25.trigger (); rect (60,480,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 500 < mouseY && mouseY <520 )
 {special65.trigger (); rect (60,500,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 520 < mouseY && mouseY <540 )
 {special34.trigger (); rect (60,520,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 540 < mouseY && mouseY <560 )
 {special8.trigger (); rect (60,540,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 560 < mouseY && mouseY <580 )
 {special26.trigger (); rect (60,560,20,20); fill (0);}
 else if (60 < mouseX && mouseX <80 && 580 < mouseY && mouseY <600 )
 {special37.trigger (); rect (60,580,20,20); fill (0);}
 
 //80-100
 if (80 < mouseX && mouseX < 100 && 0 < mouseY && mouseY <20 )
 {special12.trigger (); rect (80,0,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 20 < mouseY && mouseY <40 )
 {special53.trigger (); rect (80,20,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 40 < mouseY && mouseY <60 )
 {special9.trigger (); rect (80,40,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 60 < mouseY && mouseY <80 )
 {special4.trigger (); rect (80,60,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 80 < mouseY && mouseY <100 )
 {special45.trigger (); rect (80,80,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 100 < mouseY && mouseY <120 )
 {special36.trigger (); rect (80,100,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 120 < mouseY && mouseY <140 )
 {special15.trigger (); rect (80,120,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 140 < mouseY && mouseY <160 )
 {special18.trigger (); rect (80,140,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 160 < mouseY && mouseY <180 )
 {special28.trigger (); rect (80,160,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 180 < mouseY && mouseY <200 )
 {special54.trigger (); rect (80,180,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 200 < mouseY && mouseY <220 )
 {special34.trigger (); rect (80,200,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 220 < mouseY && mouseY <240 )
 {special43.trigger (); rect (80,220,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 240 < mouseY && mouseY <260 )
 {special65.trigger (); rect (80,240,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 260 < mouseY && mouseY <280 )
 {special12.trigger (); rect (80,260,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 280 < mouseY && mouseY <300 )
 {special13.trigger (); rect (80,280,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 300 < mouseY && mouseY <320 )
 {special14.trigger (); rect (80,300,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 320 < mouseY && mouseY <340 )
 {special15.trigger (); rect (80,320,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 340 < mouseY && mouseY <360 )
 {special16.trigger (); rect (80,340,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 360 < mouseY && mouseY <380 )
 {special17.trigger (); rect (80,360,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 380 < mouseY && mouseY <400 )
 {special18.trigger (); rect (80,380,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 400 < mouseY && mouseY <420 )
 {special11.trigger (); rect (80,400,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 420 < mouseY && mouseY <440 )
 {special23.trigger (); rect (80,420,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 440 < mouseY && mouseY <460 )
 {special33.trigger (); rect (80,440,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 460 < mouseY && mouseY <480 )
 {special43.trigger (); rect (80,460,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 480 < mouseY && mouseY <500 )
 {special65.trigger (); rect (80,480,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 500 < mouseY && mouseY <520 )
 {special39.trigger (); rect (80,500,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 520 < mouseY && mouseY <540 )
 {special29.trigger (); rect (80,520,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 540 < mouseY && mouseY <560 )
 {special3.trigger (); rect (80,540,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 560 < mouseY && mouseY <580 )
 {special6.trigger (); rect (80,560,20,20); fill (0);}
 else if (80 < mouseX && mouseX <100 && 580 < mouseY && mouseY <600 )
 {special8.trigger (); rect (80,580,20,20); fill (0);}

 //100-120
 if (100 < mouseX && mouseX < 120 && 0 < mouseY && mouseY <20 )
 {special1.trigger (); rect (100,0,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 20 < mouseY && mouseY <40 )
 {special66.trigger (); rect (100,20,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 40 < mouseY && mouseY <60 )
 {special13.trigger (); rect (100,40,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 60 < mouseY && mouseY <80 )
 {special54.trigger (); rect (100,60,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 80 < mouseY && mouseY <100 )
 {special35.trigger (); rect (100,80,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 100 < mouseY && mouseY <120 )
 {special24.trigger (); rect (100,100,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 120 < mouseY && mouseY <140 )
 {special26.trigger (); rect (100,120,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 140 < mouseY && mouseY <160 )
 {special28.trigger (); rect (100,140,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 160 < mouseY && mouseY <180 )
 {special11.trigger (); rect (100,160,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 180 < mouseY && mouseY <200 )
 {special1.trigger (); rect (100,180,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 200 < mouseY && mouseY <220 )
 {special9.trigger (); rect (100,200,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 220 < mouseY && mouseY <240 )
 {special19.trigger (); rect (100,220,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 240 < mouseY && mouseY <260 )
 {special22.trigger (); rect (100,240,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 260 < mouseY && mouseY <280 )
 {special21.trigger (); rect (100,260,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 280 < mouseY && mouseY <300 )
 {special51.trigger (); rect (100,280,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 300 < mouseY && mouseY <320 )
 {special57.trigger (); rect (100,300,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 320 < mouseY && mouseY <340 )
 {special8.trigger (); rect (100,320,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 340 < mouseY && mouseY <360 )
 {special68.trigger (); rect (100,340,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 360 < mouseY && mouseY <380 )
 {special65.trigger (); rect (100,360,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 380 < mouseY && mouseY <400 )
 {special34.trigger (); rect (100,380,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 400 < mouseY && mouseY <420 )
 {special61.trigger (); rect (100,400,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 420 < mouseY && mouseY <440 )
 {special50.trigger (); rect (100,420,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 440 < mouseY && mouseY <460 )
 {special40.trigger (); rect (100,440,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 460 < mouseY && mouseY <480 )
 {special27.trigger (); rect (100,460,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 480 < mouseY && mouseY <500 )
 {special61.trigger (); rect (100,480,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 500 < mouseY && mouseY <520 )
 {special64.trigger (); rect (100,500,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 520 < mouseY && mouseY <540 )
 {special57.trigger (); rect (100,520,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 540 < mouseY && mouseY <560 )
 {special59.trigger (); rect (100,540,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 560 < mouseY && mouseY <580 )
 {special34.trigger (); rect (100,560,20,20); fill (0);}
 else if (100 < mouseX && mouseX <120 && 580 < mouseY && mouseY <600 )
 {special7.trigger (); rect (100,580,20,20); fill (0);}

//120-140
 if (120 < mouseX && mouseX < 140 && 0 < mouseY && mouseY <20 )
 {special23.trigger (); rect (120,0,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 20 < mouseY && mouseY <40 )
 {special43.trigger (); rect (120,20,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 40 < mouseY && mouseY <60 )
 {special36.trigger (); rect (120,40,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 60 < mouseY && mouseY <80 )
 {special31.trigger (); rect (120,60,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 80 < mouseY && mouseY <100 )
 {special13.trigger (); rect (120,80,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 100 < mouseY && mouseY <120 )
 {special33.trigger (); rect (120,100,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 120 < mouseY && mouseY <140 )
 {special53.trigger (); rect (120,120,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 140 < mouseY && mouseY <160 )
 {special36.trigger (); rect (120,140,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 160 < mouseY && mouseY <180 )
 {special63.trigger (); rect (120,160,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 180 < mouseY && mouseY <200 )
 {special23.trigger (); rect (120,180,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 200 < mouseY && mouseY <220 )
 {special33.trigger (); rect (120,200,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 220 < mouseY && mouseY <240 )
 {special38.trigger (); rect (120,220,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 240 < mouseY && mouseY <260 )
 {special39.trigger (); rect (120,240,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 260 < mouseY && mouseY <280 )
 {special1.trigger (); rect (120,260,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 280 < mouseY && mouseY <300 )
 {special3.trigger (); rect (120,280,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 300 < mouseY && mouseY <320 )
 {special3.trigger (); rect (120,300,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 320 < mouseY && mouseY <340 )
 {special7.trigger (); rect (120,320,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 340 < mouseY && mouseY <360 )
 {special45.trigger (); rect (120,340,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 360 < mouseY && mouseY <380 )
 {special32.trigger (); rect (120,360,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 380 < mouseY && mouseY <400 )
 {special24.trigger (); rect (120,380,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 400 < mouseY && mouseY <420 )
 {special38.trigger (); rect (120,400,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 420 < mouseY && mouseY <440 )
 {special33.trigger (); rect (120,420,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 440 < mouseY && mouseY <460 )
 {special45.trigger (); rect (120,440,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 460 < mouseY && mouseY <480 )
 {special5.trigger (); rect (120,460,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 480 < mouseY && mouseY <500 )
 {special65.trigger (); rect (120,480,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 500 < mouseY && mouseY <520 )
 {special11.trigger (); rect (120,500,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 520 < mouseY && mouseY <540 )
 {special5.trigger (); rect (120,520,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 540 < mouseY && mouseY <560 )
 {special9.trigger (); rect (120,540,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 560 < mouseY && mouseY <580 )
 {special54.trigger (); rect (120,560,20,20); fill (0);}
 else if (120 < mouseX && mouseX <140 && 580 < mouseY && mouseY <600 )
 {special24.trigger (); rect (120,580,20,20); fill (0);}


//140-160
 if (140 < mouseX && mouseX < 160 && 0 < mouseY && mouseY <20 )
 {special1.trigger (); rect (140,0,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 20 < mouseY && mouseY <40 )
 {special65.trigger (); rect (140,20,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 40 < mouseY && mouseY <60 )
 {special34.trigger (); rect (140,40,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 60 < mouseY && mouseY <80 )
 {special65.trigger (); rect (140,60,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 80 < mouseY && mouseY <100 )
 {special34.trigger (); rect (140,80,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 100 < mouseY && mouseY <120 )
 {special56.trigger (); rect (140,100,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 120 < mouseY && mouseY <140 )
 {special29.trigger (); rect (140,120,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 140 < mouseY && mouseY <160 )
 {special9.trigger (); rect (140,140,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 160 < mouseY && mouseY <180 )
 {special39.trigger (); rect (140,160,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 180 < mouseY && mouseY <200 )
 {special63.trigger (); rect (140,180,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 200 < mouseY && mouseY <220 )
 {special53.trigger (); rect (140,200,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 220 < mouseY && mouseY <240 )
 {special43.trigger (); rect (140,220,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 240 < mouseY && mouseY <260 )
 {special35.trigger (); rect (140,240,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 260 < mouseY && mouseY <280 )
 {special31.trigger (); rect (140,260,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 280 < mouseY && mouseY <300 )
 {special37.trigger (); rect (140,280,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 300 < mouseY && mouseY <320 )
 {special38.trigger (); rect (140,300,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 320 < mouseY && mouseY <340 )
 {special33.trigger (); rect (140,320,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 340 < mouseY && mouseY <360 )
 {special39.trigger (); rect (140,340,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 360 < mouseY && mouseY <380 )
 {special32.trigger (); rect (140,360,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 380 < mouseY && mouseY <400 )
 {special24.trigger (); rect (140,380,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 400 < mouseY && mouseY <420 )
 {special61.trigger (); rect (140,400,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 420 < mouseY && mouseY <440 )
 {special60.trigger (); rect (140,420,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 440 < mouseY && mouseY <460 )
 {special20.trigger (); rect (140,440,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 460 < mouseY && mouseY <480 )
 {special55.trigger (); rect (140,460,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 480 < mouseY && mouseY <500 )
 {special50.trigger (); rect (140,480,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 500 < mouseY && mouseY <520 )
 {special65.trigger (); rect (140,500,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 520 < mouseY && mouseY <540 )
 {special10.trigger (); rect (140,520,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 540 < mouseY && mouseY <560 )
 {special6.trigger (); rect (140,540,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 560 < mouseY && mouseY <580 )
 {special40.trigger (); rect (140,560,20,20); fill (0);}
 else if (140 < mouseX && mouseX <160 && 580 < mouseY && mouseY <600 )
 {special43.trigger (); rect (140,580,20,20); fill (0);}

//160-180
 if (160 < mouseX && mouseX < 180 && 0 < mouseY && mouseY <20 )
 {special3.trigger (); rect (160,0,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 20 < mouseY && mouseY <40 )
 {special54.trigger (); rect (160,20,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 40 < mouseY && mouseY <60 )
 {special65.trigger (); rect (160,40,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 60 < mouseY && mouseY <80 )
 {special23.trigger (); rect (160,60,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 80 < mouseY && mouseY <100 )
 {special34.trigger (); rect (160,80,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 100 < mouseY && mouseY <120 )
 {special31.trigger (); rect (160,100,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 120 < mouseY && mouseY <140 )
 {special11.trigger (); rect (160,120,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 140 < mouseY && mouseY <160 )
 {special1.trigger (); rect (160,140,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 160 < mouseY && mouseY <180 )
 {special2.trigger (); rect (160,160,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 180 < mouseY && mouseY <200 )
 {special3.trigger (); rect (160,180,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 200 < mouseY && mouseY <220 )
 {special4.trigger (); rect (160,200,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 220 < mouseY && mouseY <240 )
 {special5.trigger (); rect (160,220,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 240 < mouseY && mouseY <260 )
 {special6.trigger (); rect (160,240,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 260 < mouseY && mouseY <280 )
 {special7.trigger (); rect (160,260,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 280 < mouseY && mouseY <300 )
 {special8.trigger (); rect (160,280,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 300 < mouseY && mouseY <320 )
 {special9.trigger (); rect (160,300,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 320 < mouseY && mouseY <340 )
 {special10.trigger (); rect (160,320,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 340 < mouseY && mouseY <360 )
 {special11.trigger (); rect (160,340,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 360 < mouseY && mouseY <380 )
 {special13.trigger (); rect (160,360,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 380 < mouseY && mouseY <400 )
 {special12.trigger (); rect (160,380,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 400 < mouseY && mouseY <420 )
 {special14.trigger (); rect (160,400,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 420 < mouseY && mouseY <440 )
 {special15.trigger (); rect (160,420,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 440 < mouseY && mouseY <460 )
 {special11.trigger (); rect (160,440,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 460 < mouseY && mouseY <480 )
 {special16.trigger (); rect (160,460,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 480 < mouseY && mouseY <500 )
 {special19.trigger (); rect (160,480,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 500 < mouseY && mouseY <520 )
 {special20.trigger (); rect (160,500,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 520 < mouseY && mouseY <540 )
 {special21.trigger (); rect (160,520,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 540 < mouseY && mouseY <560 )
 {special22.trigger (); rect (160,540,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 560 < mouseY && mouseY <580 )
 {special23.trigger (); rect (160,560,20,20); fill (0);}
 else if (160 < mouseX && mouseX <180 && 580 < mouseY && mouseY <600 )
 {special24.trigger (); rect (160,580,20,20); fill (0);}

//180-200
 if (180 < mouseX && mouseX < 200 && 0 < mouseY && mouseY <20 )
 {special25.trigger (); rect (180,0,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 20 < mouseY && mouseY <40 )
 {special26.trigger (); rect (180,20,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 40 < mouseY && mouseY <60 )
 {special27.trigger (); rect (180,40,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 60 < mouseY && mouseY <80 )
 {special29.trigger (); rect (180,60,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 80 < mouseY && mouseY <100 )
 {special34.trigger (); rect (180,80,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 100 < mouseY && mouseY <120 )
 {special35.trigger (); rect (180,100,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 120 < mouseY && mouseY <140 )
 {special36.trigger (); rect (180,120,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 140 < mouseY && mouseY <160 )
 {special37.trigger (); rect (180,140,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 160 < mouseY && mouseY <180 )
 {special38.trigger (); rect (180,160,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 180 < mouseY && mouseY <200 )
 {special3.trigger (); rect (180,180,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 200 < mouseY && mouseY <220 )
 {special39.trigger (); rect (180,200,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 220 < mouseY && mouseY <240 )
 {special40.trigger (); rect (180,220,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 240 < mouseY && mouseY <260 )
 {special41.trigger (); rect (180,240,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 260 < mouseY && mouseY <280 )
 {special42.trigger (); rect (180,260,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 280 < mouseY && mouseY <300 )
 {special43.trigger (); rect (180,280,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 300 < mouseY && mouseY <320 )
 {special44.trigger (); rect (180,300,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 320 < mouseY && mouseY <340 )
 {special45.trigger (); rect (180,320,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 340 < mouseY && mouseY <360 )
 {special46.trigger (); rect (180,340,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 360 < mouseY && mouseY <380 )
 {special47.trigger (); rect (180,360,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 380 < mouseY && mouseY <400 )
 {special48.trigger (); rect (180,380,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 400 < mouseY && mouseY <420 )
 {special48.trigger (); rect (180,400,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 420 < mouseY && mouseY <440 )
 {special50.trigger (); rect (180,420,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 440 < mouseY && mouseY <460 )
 {special51.trigger (); rect (180,440,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 460 < mouseY && mouseY <480 )
 {special51.trigger (); rect (180,460,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 480 < mouseY && mouseY <500 )
 {special52.trigger (); rect (180,480,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 500 < mouseY && mouseY <520 )
 {special52.trigger (); rect (180,500,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 520 < mouseY && mouseY <540 )
 {special53.trigger (); rect (180,520,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 540 < mouseY && mouseY <560 )
 {special54.trigger (); rect (180,540,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 560 < mouseY && mouseY <580 )
 {special55.trigger (); rect (180,560,20,20); fill (0);}
 else if (180 < mouseX && mouseX <200 && 580 < mouseY && mouseY <600 )
 {special56.trigger (); rect (180,580,20,20); fill (0);}

//200-220
 if (200 < mouseX && mouseX < 220 && 0 < mouseY && mouseY <20 )
 {special66.trigger (); rect (200,0,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 20 < mouseY && mouseY <40 )
 {special33.trigger (); rect (200,20,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 40 < mouseY && mouseY <60 )
 {special34.trigger (); rect (200,40,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 60 < mouseY && mouseY <80 )
 {special56.trigger (); rect (200,60,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 80 < mouseY && mouseY <100 )
 {special67.trigger (); rect (200,80,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 100 < mouseY && mouseY <120 )
 {special33.trigger (); rect (200,100,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 120 < mouseY && mouseY <140 )
 {special66.trigger (); rect (200,120,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 140 < mouseY && mouseY <160 )
 {special11.trigger (); rect (200,140,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 160 < mouseY && mouseY <180 )
 {special12.trigger (); rect (200,160,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 180 < mouseY && mouseY <200 )
 {special45.trigger (); rect (200,180,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 200 < mouseY && mouseY <220 )
 {special61.trigger (); rect (200,200,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 220 < mouseY && mouseY <240 )
 {special33.trigger (); rect (200,220,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 240 < mouseY && mouseY <260 )
 {special34.trigger (); rect (200,240,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 260 < mouseY && mouseY <280 )
 {special35.trigger (); rect (200,260,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 280 < mouseY && mouseY <300 )
 {special36.trigger (); rect (200,280,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 300 < mouseY && mouseY <320 )
 {special3.trigger (); rect (200,300,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 320 < mouseY && mouseY <340 )
 {special45.trigger (); rect (200,320,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 340 < mouseY && mouseY <360 )
 {special43.trigger (); rect (200,340,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 360 < mouseY && mouseY <380 )
 {special65.trigger (); rect (200,360,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 380 < mouseY && mouseY <400 )
 {special12.trigger (); rect (200,380,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 400 < mouseY && mouseY <420 )
 {special3.trigger (); rect (200,400,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 420 < mouseY && mouseY <440 )
 {special13.trigger (); rect (200,420,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 440 < mouseY && mouseY <460 )
 {special13.trigger (); rect (200,440,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 460 < mouseY && mouseY <480 )
 {special16.trigger (); rect (200,460,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 480 < mouseY && mouseY <500 )
 {special17.trigger (); rect (200,480,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 500 < mouseY && mouseY <520 )
 {special18.trigger (); rect (200,500,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 520 < mouseY && mouseY <540 )
 {special19.trigger (); rect (200,520,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 540 < mouseY && mouseY <560 )
 {special20.trigger (); rect (200,540,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 560 < mouseY && mouseY <580 )
 {special4.trigger (); rect (200,560,20,20); fill (0);}
 else if (200 < mouseX && mouseX <220 && 580 < mouseY && mouseY <600 )
 {special7.trigger (); rect (200,580,20,20); fill (0);}

//220-240
 if (220 < mouseX && mouseX < 240 && 0 < mouseY && mouseY <20 )
 {special7.trigger (); rect (220,0,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 20 < mouseY && mouseY <40 )
 {special8.trigger (); rect (220,20,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 40 < mouseY && mouseY <60 )
 {special4.trigger (); rect (220,40,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 60 < mouseY && mouseY <80 )
 {special34.trigger (); rect (220,60,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 80 < mouseY && mouseY <100 )
 {special53.trigger (); rect (220,80,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 100 < mouseY && mouseY <120 )
 {special3.trigger (); rect (220,100,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 120 < mouseY && mouseY <140 )
 {special45.trigger (); rect (220,120,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 140 < mouseY && mouseY <160 )
 {special39.trigger (); rect (220,140,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 160 < mouseY && mouseY <180 )
 {special23.trigger (); rect (220,160,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 180 < mouseY && mouseY <200 )
 {special49.trigger (); rect (220,180,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 200 < mouseY && mouseY <220 )
 {special39.trigger (); rect (220,200,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 220 < mouseY && mouseY <240 )
 {special38.trigger (); rect (220,220,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 240 < mouseY && mouseY <260 )
 {special7.trigger (); rect (220,240,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 260 < mouseY && mouseY <280 )
 {special45.trigger (); rect (220,260,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 280 < mouseY && mouseY <300 )
 {special34.trigger (); rect (220,280,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 300 < mouseY && mouseY <320 )
 {special7.trigger (); rect (220,300,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 320 < mouseY && mouseY <340 )
 {special34.trigger (); rect (220,320,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 340 < mouseY && mouseY <360 )
 {special56.trigger (); rect (220,340,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 360 < mouseY && mouseY <380 )
 {special1.trigger (); rect (220,360,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 380 < mouseY && mouseY <400 )
 {special2.trigger (); rect (220,380,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 400 < mouseY && mouseY <420 )
 {special3.trigger (); rect (220,400,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 420 < mouseY && mouseY <440 )
 {special4.trigger (); rect (220,420,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 440 < mouseY && mouseY <460 )
 {special5.trigger (); rect (220,440,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 460 < mouseY && mouseY <480 )
 {special6.trigger (); rect (220,460,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 480 < mouseY && mouseY <500 )
 {special7.trigger (); rect (220,480,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 500 < mouseY && mouseY <520 )
 {special8.trigger (); rect (220,500,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 520 < mouseY && mouseY <540 )
 {special9.trigger (); rect (220,520,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 540 < mouseY && mouseY <560 )
 {special2.trigger (); rect (220,540,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 560 < mouseY && mouseY <580 )
 {special21.trigger (); rect (220,560,20,20); fill (0);}
 else if (220 < mouseX && mouseX <240 && 580 < mouseY && mouseY <600 )
 {special22.trigger (); rect (220,580,20,20); fill (0);}

//240-260
 if (240 < mouseX && mouseX < 260 && 0 < mouseY && mouseY <20 )
 {special23.trigger (); rect (240,0,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 20 < mouseY && mouseY <40 )
 {special23.trigger (); rect (240,20,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 40 < mouseY && mouseY <60 )
 {special43.trigger (); rect (240,40,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 60 < mouseY && mouseY <80 )
 {special25.trigger (); rect (240,60,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 80 < mouseY && mouseY <100 )
 {special26.trigger (); rect (240,80,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 100 < mouseY && mouseY <120 )
 {special27.trigger (); rect (240,100,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 120 < mouseY && mouseY <140 )
 {special28.trigger (); rect (240,120,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 140 < mouseY && mouseY <160 )
 {special35.trigger (); rect (240,140,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 160 < mouseY && mouseY <180 )
 {special43.trigger (); rect (240,160,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 180 < mouseY && mouseY <200 )
 {special31.trigger (); rect (240,180,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 200 < mouseY && mouseY <220 )
 {special34.trigger (); rect (240,200,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 220 < mouseY && mouseY <240 )
 {special6.trigger (); rect (240,220,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 240 < mouseY && mouseY <260 )
 {special63.trigger (); rect (240,240,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 260 < mouseY && mouseY <280 )
 {special54.trigger (); rect (240,260,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 280 < mouseY && mouseY <300 )
 {special59.trigger (); rect (240,280,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 300 < mouseY && mouseY <320 )
 {special51.trigger (); rect (240,300,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 320 < mouseY && mouseY <340 )
 {special34.trigger (); rect (240,320,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 340 < mouseY && mouseY <360 )
 {special14.trigger (); rect (240,340,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 360 < mouseY && mouseY <380 )
 {special24.trigger (); rect (240,360,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 380 < mouseY && mouseY <400 )
 {special65.trigger (); rect (240,380,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 400 < mouseY && mouseY <420 )
 {special34.trigger (); rect (240,400,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 420 < mouseY && mouseY <440 )
 {special65.trigger (); rect (240,420,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 440 < mouseY && mouseY <460 )
 {special57.trigger (); rect (240,440,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 460 < mouseY && mouseY <480 )
 {special59.trigger (); rect (240,460,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 480 < mouseY && mouseY <500 )
 {special56.trigger (); rect (240,480,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 500 < mouseY && mouseY <520 )
 {special34.trigger (); rect (240,500,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 520 < mouseY && mouseY <540 )
 {special36.trigger (); rect (240,520,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 540 < mouseY && mouseY <560 )
 {special63.trigger (); rect (240,540,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 560 < mouseY && mouseY <580 )
 {special34.trigger (); rect (240,560,20,20); fill (0);}
 else if (240 < mouseX && mouseX <260 && 580 < mouseY && mouseY <600 )
 {special54.trigger (); rect (240,580,20,20); fill (0);}

//260-280
 if (260 < mouseX && mouseX < 280 && 0 < mouseY && mouseY <20 )
 {special34.trigger (); rect (260,0,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 20 < mouseY && mouseY <40 )
 {special67.trigger (); rect (260,20,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 40 < mouseY && mouseY <60 )
 {special56.trigger (); rect (260,40,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 60 < mouseY && mouseY <80 )
 {special34.trigger (); rect (260,60,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 80 < mouseY && mouseY <100 )
 {special6.trigger (); rect (260,80,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 100 < mouseY && mouseY <120 )
 {special7.trigger (); rect (260,100,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 120 < mouseY && mouseY <140 )
 {special8.trigger (); rect (260,120,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 140 < mouseY && mouseY <160 )
 {special34.trigger (); rect (260,140,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 160 < mouseY && mouseY <180 )
 {special2.trigger (); rect (260,160,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 180 < mouseY && mouseY <200 )
 {special45.trigger (); rect (260,180,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 200 < mouseY && mouseY <220 )
 {special54.trigger (); rect (260,200,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 220 < mouseY && mouseY <240 )
 {special6.trigger (); rect (260,220,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 240 < mouseY && mouseY <260 )
 {special7.trigger (); rect (260,240,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 260 < mouseY && mouseY <280 )
 {special8.trigger (); rect (260,260,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 280 < mouseY && mouseY <300 )
 {special34.trigger (); rect (260,280,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 300 < mouseY && mouseY <320 )
 {special23.trigger (); rect (260,300,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 320 < mouseY && mouseY <340 )
 {special33.trigger (); rect (260,320,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 340 < mouseY && mouseY <360 )
 {special34.trigger (); rect (260,340,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 360 < mouseY && mouseY <380 )
 {special35.trigger (); rect (260,360,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 380 < mouseY && mouseY <400 )
 {special36.trigger (); rect (260,380,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 400 < mouseY && mouseY <420 )
 {special37.trigger (); rect (260,400,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 420 < mouseY && mouseY <440 )
 {special38.trigger (); rect (260,420,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 440 < mouseY && mouseY <460 )
 {special39.trigger (); rect (260,440,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 460 < mouseY && mouseY <480 )
 {special39.trigger (); rect (260,460,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 480 < mouseY && mouseY <500 )
 {special65.trigger (); rect (260,480,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 500 < mouseY && mouseY <520 )
 {special34.trigger (); rect (260,500,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 520 < mouseY && mouseY <540 )
 {special56.trigger (); rect (260,520,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 540 < mouseY && mouseY <560 )
 {special45.trigger (); rect (260,540,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 560 < mouseY && mouseY <580 )
 {special38.trigger (); rect (260,560,20,20); fill (0);}
 else if (260 < mouseX && mouseX <280 && 580 < mouseY && mouseY <600 )
 {special27.trigger (); rect (260,580,20,20); fill (0);}


//280-300
 if (280 < mouseX && mouseX < 300 && 0 < mouseY && mouseY <20 )
 {special53.trigger (); rect (280,0,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 20 < mouseY && mouseY <40 )
 {special66.trigger (); rect (280,20,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 40 < mouseY && mouseY <60 )
 {special67.trigger (); rect (280,40,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 60 < mouseY && mouseY <80 )
 {special68.trigger (); rect (280,60,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 80 < mouseY && mouseY <100 )
 {special34.trigger (); rect (280,80,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 100 < mouseY && mouseY <120 )
 {special54.trigger (); rect (280,100,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 120 < mouseY && mouseY <140 )
 {special65.trigger (); rect (280,120,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 140 < mouseY && mouseY <160 )
 {special23.trigger (); rect (280,140,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 160 < mouseY && mouseY <180 )
 {special12.trigger (); rect (280,160,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 180 < mouseY && mouseY <200 )
 {special11.trigger (); rect (280,180,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 200 < mouseY && mouseY <220 )
 {special14.trigger (); rect (280,200,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 220 < mouseY && mouseY <240 )
 {special23.trigger (); rect (280,220,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 240 < mouseY && mouseY <260 )
 {special23.trigger (); rect (280,240,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 260 < mouseY && mouseY <280 )
 {special63.trigger (); rect (280,260,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 280 < mouseY && mouseY <300 )
 {special43.trigger (); rect (280,280,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 300 < mouseY && mouseY <320 )
 {special33.trigger (); rect (280,300,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 320 < mouseY && mouseY <340 )
 {special56.trigger (); rect (280,320,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 340 < mouseY && mouseY <360 )
 {special45.trigger (); rect (280,340,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 360 < mouseY && mouseY <380 )
 {special65.trigger (); rect (280,360,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 380 < mouseY && mouseY <400 )
 {special65.trigger (); rect (280,380,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 400 < mouseY && mouseY <420 )
 {special34.trigger (); rect (280,400,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 420 < mouseY && mouseY <440 )
 {special65.trigger (); rect (280,420,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 440 < mouseY && mouseY <460 )
 {special59.trigger (); rect (280,440,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 460 < mouseY && mouseY <480 )
 {special49.trigger (); rect (280,460,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 480 < mouseY && mouseY <500 )
 {special39.trigger (); rect (280,480,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 500 < mouseY && mouseY <520 )
 {special24.trigger (); rect (280,500,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 520 < mouseY && mouseY <540 )
 {special56.trigger (); rect (280,520,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 540 < mouseY && mouseY <560 )
 {special54.trigger (); rect (280,540,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 560 < mouseY && mouseY <580 )
 {special68.trigger (); rect (280,560,20,20); fill (0);}
 else if (280 < mouseX && mouseX <300 && 580 < mouseY && mouseY <600 )
 {special45.trigger (); rect (280,580,20,20); fill (0);}

//300-320
 if (300 < mouseX && mouseX < 320 && 0 < mouseY && mouseY <20 )
 {special3.trigger (); rect (300,0,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 20 < mouseY && mouseY <40 )
 {special13.trigger (); rect (300,20,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 40 < mouseY && mouseY <60 )
 {special65.trigger (); rect (300,40,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 60 < mouseY && mouseY <80 )
 {special23.trigger (); rect (300,60,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 80 < mouseY && mouseY <100 )
 {special45.trigger (); rect (300,80,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 100 < mouseY && mouseY <120 )
 {special65.trigger (); rect (300,100,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 120 < mouseY && mouseY <140 )
 {special34.trigger (); rect (300,120,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 140 < mouseY && mouseY <160 )
 {special4.trigger (); rect (300,140,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 160 < mouseY && mouseY <180 )
 {special44.trigger (); rect (300,160,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 180 < mouseY && mouseY <200 )
 {special5.trigger (); rect (300,180,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 200 < mouseY && mouseY <220 )
 {special6.trigger (); rect (300,200,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 220 < mouseY && mouseY <240 )
 {special7.trigger (); rect (300,220,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 240 < mouseY && mouseY <260 )
 {special8.trigger (); rect (300,240,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 260 < mouseY && mouseY <280 )
 {special12.trigger (); rect (300,260,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 280 < mouseY && mouseY <300 )
 {special45.trigger (); rect (300,280,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 300 < mouseY && mouseY <320 )
 {special34.trigger (); rect (300,300,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 320 < mouseY && mouseY <340 )
 {special65.trigger (); rect (300,320,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 340 < mouseY && mouseY <360 )
 {special34.trigger (); rect (300,340,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 360 < mouseY && mouseY <380 )
 {special23.trigger (); rect (300,360,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 380 < mouseY && mouseY <400 )
 {special33.trigger (); rect (300,380,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 400 < mouseY && mouseY <420 )
 {special54.trigger (); rect (300,400,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 420 < mouseY && mouseY <440 )
 {special65.trigger (); rect (300,420,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 440 < mouseY && mouseY <460 )
 {special27.trigger (); rect (300,440,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 460 < mouseY && mouseY <480 )
 {special27.trigger (); rect (300,460,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 480 < mouseY && mouseY <500 )
 {special7.trigger (); rect (300,480,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 500 < mouseY && mouseY <520 )
 {special48.trigger (); rect (300,500,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 520 < mouseY && mouseY <540 )
 {special49.trigger (); rect (300,520,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 540 < mouseY && mouseY <560 )
 {special39.trigger (); rect (300,540,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 560 < mouseY && mouseY <580 )
 {special39.trigger (); rect (300,560,20,20); fill (0);}
 else if (300 < mouseX && mouseX <320 && 580 < mouseY && mouseY <600 )
 {special43.trigger (); rect (300,580,20,20); fill (0);}

//320-340
 if (320 < mouseX && mouseX < 340 && 0 < mouseY && mouseY <20 )
 {special56.trigger (); rect (320,0,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 20 < mouseY && mouseY <40 )
 {special58.trigger (); rect (320,20,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 40 < mouseY && mouseY <60 )
 {special9.trigger (); rect (320,40,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 60 < mouseY && mouseY <80 )
 {special8.trigger (); rect (320,60,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 80 < mouseY && mouseY <100 )
 {special38.trigger (); rect (320,80,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 100 < mouseY && mouseY <120 )
 {special48.trigger (); rect (320,100,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 120 < mouseY && mouseY <140 )
 {special59.trigger (); rect (320,120,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 140 < mouseY && mouseY <160 )
 {special65.trigger (); rect (320,140,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 160 < mouseY && mouseY <180 )
 {special34.trigger (); rect (320,160,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 180 < mouseY && mouseY <200 )
 {special7.trigger (); rect (320,180,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 200 < mouseY && mouseY <220 )
 {special13.trigger (); rect (320,200,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 220 < mouseY && mouseY <240 )
 {special45.trigger (); rect (320,220,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 240 < mouseY && mouseY <260 )
 {special65.trigger (); rect (320,240,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 260 < mouseY && mouseY <280 )
 {special24.trigger (); rect (320,260,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 280 < mouseY && mouseY <300 )
 {special45.trigger (); rect (320,280,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 300 < mouseY && mouseY <320 )
 {special7.trigger (); rect (320,300,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 320 < mouseY && mouseY <340 )
 {special45.trigger (); rect (320,320,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 340 < mouseY && mouseY <360 )
 {special54.trigger (); rect (320,340,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 360 < mouseY && mouseY <380 )
 {special6.trigger (); rect (320,360,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 380 < mouseY && mouseY <400 )
 {special34.trigger (); rect (320,380,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 400 < mouseY && mouseY <420 )
 {special56.trigger (); rect (320,400,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 420 < mouseY && mouseY <440 )
 {special24.trigger (); rect (320,420,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 440 < mouseY && mouseY <460 )
 {special34.trigger (); rect (320,440,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 460 < mouseY && mouseY <480 )
 {special45.trigger (); rect (320,460,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 480 < mouseY && mouseY <500 )
 {special65.trigger (); rect (320,480,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 500 < mouseY && mouseY <520 )
 {special68.trigger (); rect (320,500,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 520 < mouseY && mouseY <540 )
 {special28.trigger (); rect (320,520,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 540 < mouseY && mouseY <560 )
 {special38.trigger (); rect (320,540,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 560 < mouseY && mouseY <580 )
 {special45.trigger (); rect (320,560,20,20); fill (0);}
 else if (320 < mouseX && mouseX <340 && 580 < mouseY && mouseY <600 )
 {special56.trigger (); rect (320,580,20,20); fill (0);}


//340-360
 if (340 < mouseX && mouseX < 360 && 0 < mouseY && mouseY <20 )
 {special6.trigger (); rect (340,0,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 20 < mouseY && mouseY <40 )
 {special34.trigger (); rect (340,20,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 40 < mouseY && mouseY <60 )
 {special35.trigger (); rect (340,40,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 60 < mouseY && mouseY <80 )
 {special56.trigger (); rect (340,60,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 80 < mouseY && mouseY <100 )
 {special56.trigger (); rect (340,80,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 100 < mouseY && mouseY <120 )
 {special65.trigger (); rect (340,100,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 120 < mouseY && mouseY <140 )
 {special34.trigger (); rect (340,120,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 140 < mouseY && mouseY <160 )
 {special56.trigger (); rect (340,140,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 160 < mouseY && mouseY <180 )
 {special34.trigger (); rect (340,160,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 180 < mouseY && mouseY <200 )
 {special24.trigger (); rect (340,180,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 200 < mouseY && mouseY <220 )
 {special22.trigger (); rect (340,200,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 220 < mouseY && mouseY <240 )
 {special36.trigger (); rect (340,220,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 240 < mouseY && mouseY <260 )
 {special31.trigger (); rect (340,240,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 260 < mouseY && mouseY <280 )
 {special32.trigger (); rect (340,260,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 280 < mouseY && mouseY <300 )
 {special33.trigger (); rect (340,280,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 300 < mouseY && mouseY <320 )
 {special34.trigger (); rect (340,300,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 320 < mouseY && mouseY <340 )
 {special35.trigger (); rect (340,320,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 340 < mouseY && mouseY <360 )
 {special36.trigger (); rect (340,340,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 360 < mouseY && mouseY <380 )
 {special37.trigger (); rect (340,360,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 380 < mouseY && mouseY <400 )
 {special38.trigger (); rect (340,380,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 400 < mouseY && mouseY <420 )
 {special39.trigger (); rect (340,400,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 420 < mouseY && mouseY <440 )
 {special40.trigger (); rect (340,420,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 440 < mouseY && mouseY <460 )
 {special65.trigger (); rect (340,440,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 460 < mouseY && mouseY <480 )
 {special34.trigger (); rect (340,460,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 480 < mouseY && mouseY <500 )
 {special45.trigger (); rect (340,480,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 500 < mouseY && mouseY <520 )
 {special25.trigger (); rect (340,500,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 520 < mouseY && mouseY <540 )
 {special24.trigger (); rect (340,520,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 540 < mouseY && mouseY <560 )
 {special45.trigger (); rect (340,540,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 560 < mouseY && mouseY <580 )
 {special6.trigger (); rect (340,560,20,20); fill (0);}
 else if (340 < mouseX && mouseX <360 && 580 < mouseY && mouseY <600 )
 {special34.trigger (); rect (340,580,20,20); fill (0);}


//360-380
 if (360 < mouseX && mouseX < 380 && 0 < mouseY && mouseY <20 )
 {special12.trigger (); rect (360,0,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 20 < mouseY && mouseY <40 )
 {special1.trigger (); rect (360,20,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 40 < mouseY && mouseY <60 )
 {special22.trigger (); rect (360,40,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 60 < mouseY && mouseY <80 )
 {special3.trigger (); rect (360,60,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 80 < mouseY && mouseY <100 )
 {special3.trigger (); rect (360,80,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 100 < mouseY && mouseY <120 )
 {special44.trigger (); rect (360,100,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 120 < mouseY && mouseY <140 )
 {special5.trigger (); rect (360,120,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 140 < mouseY && mouseY <160 )
 {special5.trigger (); rect (360,140,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 160 < mouseY && mouseY <180 )
 {special6.trigger (); rect (360,160,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 180 < mouseY && mouseY <200 )
 {special56.trigger (); rect (360,180,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 200 < mouseY && mouseY <220 )
 {special30.trigger (); rect (360,200,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 220 < mouseY && mouseY <240 )
 {special30.trigger (); rect (360,220,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 240 < mouseY && mouseY <260 )
 {special20.trigger (); rect (360,240,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 260 < mouseY && mouseY <280 )
 {special10.trigger (); rect (360,260,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 280 < mouseY && mouseY <300 )
 {special11.trigger (); rect (360,280,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 300 < mouseY && mouseY <320 )
 {special7.trigger (); rect (360,300,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 320 < mouseY && mouseY <340 )
 {special9.trigger (); rect (360,320,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 340 < mouseY && mouseY <360 )
 {special29.trigger (); rect (360,340,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 360 < mouseY && mouseY <380 )
 {special59.trigger (); rect (360,360,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 380 < mouseY && mouseY <400 )
 {special37.trigger (); rect (360,380,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 400 < mouseY && mouseY <420 )
 {special33.trigger (); rect (360,400,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 420 < mouseY && mouseY <440 )
 {special38.trigger (); rect (360,420,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 440 < mouseY && mouseY <460 )
 {special37.trigger (); rect (360,440,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 460 < mouseY && mouseY <480 )
 {special67.trigger (); rect (360,460,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 480 < mouseY && mouseY <500 )
 {special68.trigger (); rect (360,480,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 500 < mouseY && mouseY <520 )
 {special63.trigger (); rect (360,500,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 520 < mouseY && mouseY <540 )
 {special31.trigger (); rect (360,520,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 540 < mouseY && mouseY <560 )
 {special27.trigger (); rect (360,540,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 560 < mouseY && mouseY <580 )
 {special25.trigger (); rect (360,560,20,20); fill (0);}
 else if (360 < mouseX && mouseX <380 && 580 < mouseY && mouseY <600 )
 {special56.trigger (); rect (360,580,20,20); fill (0);}


//380-400
 if (380 < mouseX && mouseX < 400 && 0 < mouseY && mouseY <20 )
 {special8.trigger (); rect (380,0,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 20 < mouseY && mouseY <40 )
 {special18.trigger (); rect (380,20,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 40 < mouseY && mouseY <60 )
 {special28.trigger (); rect (380,40,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 60 < mouseY && mouseY <80 )
 {special33.trigger (); rect (380,60,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 80 < mouseY && mouseY <100 )
 {special35.trigger (); rect (380,80,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 100 < mouseY && mouseY <120 )
 {special38.trigger (); rect (380,100,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 120 < mouseY && mouseY <140 )
 {special45.trigger (); rect (380,120,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 140 < mouseY && mouseY <160 )
 {special54.trigger (); rect (380,140,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 160 < mouseY && mouseY <180 )
 {special67.trigger (); rect (380,160,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 180 < mouseY && mouseY <200 )
 {special54.trigger (); rect (380,180,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 200 < mouseY && mouseY <220 )
 {special34.trigger (); rect (380,200,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 220 < mouseY && mouseY <240 )
 {special23.trigger (); rect (380,220,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 240 < mouseY && mouseY <260 )
 {special62.trigger (); rect (380,240,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 260 < mouseY && mouseY <280 )
 {special47.trigger (); rect (380,260,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 280 < mouseY && mouseY <300 )
 {special43.trigger (); rect (380,280,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 300 < mouseY && mouseY <320 )
 {special27.trigger (); rect (380,300,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 320 < mouseY && mouseY <340 )
 {special56.trigger (); rect (380,320,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 340 < mouseY && mouseY <360 )
 {special65.trigger (); rect (380,340,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 360 < mouseY && mouseY <380 )
 {special7.trigger (); rect (380,360,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 380 < mouseY && mouseY <400 )
 {special11.trigger (); rect (380,380,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 400 < mouseY && mouseY <420 )
 {special37.trigger (); rect (380,400,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 420 < mouseY && mouseY <440 )
 {special34.trigger (); rect (380,420,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 440 < mouseY && mouseY <460 )
 {special29.trigger (); rect (380,440,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 460 < mouseY && mouseY <480 )
 {special39.trigger (); rect (380,460,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 480 < mouseY && mouseY <500 )
 {special35.trigger (); rect (380,480,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 500 < mouseY && mouseY <520 )
 {special45.trigger (); rect (380,500,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 520 < mouseY && mouseY <540 )
 {special10.trigger (); rect (380,520,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 540 < mouseY && mouseY <560 )
 {special20.trigger (); rect (380,540,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 560 < mouseY && mouseY <580 )
 {special30.trigger (); rect (380,560,20,20); fill (0);}
 else if (380 < mouseX && mouseX <400 && 580 < mouseY && mouseY <600 )
 {special40.trigger (); rect (380,580,20,20); fill (0);}

//400-420
 if (400 < mouseX && mouseX < 420 && 0 < mouseY && mouseY <20 )
 {special46.trigger (); rect (400,0,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 20 < mouseY && mouseY <40 )
 {special56.trigger (); rect (400,20,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 40 < mouseY && mouseY <60 )
 {special7.trigger (); rect (400,40,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 60 < mouseY && mouseY <80 )
 {special45.trigger (); rect (400,60,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 80 < mouseY && mouseY <100 )
 {special5.trigger (); rect (400,80,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 100 < mouseY && mouseY <120 )
 {special7.trigger (); rect (400,100,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 120 < mouseY && mouseY <140 )
 {special66.trigger (); rect (400,120,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 140 < mouseY && mouseY <160 )
 {special55.trigger (); rect (400,140,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 160 < mouseY && mouseY <180 )
 {special44.trigger (); rect (400,160,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 180 < mouseY && mouseY <200 )
 {special33.trigger (); rect (400,180,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 200 < mouseY && mouseY <220 )
 {special22.trigger (); rect (400,200,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 220 < mouseY && mouseY <240 )
 {special11.trigger (); rect (400,220,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 240 < mouseY && mouseY <260 )
 {special11.trigger (); rect (400,240,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 260 < mouseY && mouseY <280 )
 {special11.trigger (); rect (400,260,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 280 < mouseY && mouseY <300 )
 {special54.trigger (); rect (400,280,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 300 < mouseY && mouseY <320 )
 {special3.trigger (); rect (400,300,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 320 < mouseY && mouseY <340 )
 {special6.trigger (); rect (400,320,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 340 < mouseY && mouseY <360 )
 {special8.trigger (); rect (400,340,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 360 < mouseY && mouseY <380 )
 {special9.trigger (); rect (400,360,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 380 < mouseY && mouseY <400 )
 {special59.trigger (); rect (400,380,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 400 < mouseY && mouseY <420 )
 {special63.trigger (); rect (400,400,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 420 < mouseY && mouseY <440 )
 {special56.trigger (); rect (400,420,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 440 < mouseY && mouseY <460 )
 {special23.trigger (); rect (400,440,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 460 < mouseY && mouseY <480 )
 {special54.trigger (); rect (400,460,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 480 < mouseY && mouseY <500 )
 {special65.trigger (); rect (400,480,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 500 < mouseY && mouseY <520 )
 {special65.trigger (); rect (400,500,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 520 < mouseY && mouseY <540 )
 {special45.trigger (); rect (400,520,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 540 < mouseY && mouseY <560 )
 {special65.trigger (); rect (400,540,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 560 < mouseY && mouseY <580 )
 {special26.trigger (); rect (400,560,20,20); fill (0);}
 else if (400 < mouseX && mouseX <420 && 580 < mouseY && mouseY <600 )
 {special56.trigger (); rect (400,580,20,20); fill (0);}


//420-440
 if (420 < mouseX && mouseX < 440 && 0 < mouseY && mouseY <20 )
 {special56.trigger (); rect (420,0,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 20 < mouseY && mouseY <40 )
 {special5.trigger (); rect (420,20,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 40 < mouseY && mouseY <60 )
 {special1.trigger (); rect (420,40,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 60 < mouseY && mouseY <80 )
 {special4.trigger (); rect (420,60,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 80 < mouseY && mouseY <100 )
 {special56.trigger (); rect (420,80,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 100 < mouseY && mouseY <120 )
 {special34.trigger (); rect (420,100,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 120 < mouseY && mouseY <140 )
 {special45.trigger (); rect (420,120,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 140 < mouseY && mouseY <160 )
 {special65.trigger (); rect (420,140,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 160 < mouseY && mouseY <180 )
 {special23.trigger (); rect (420,160,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 180 < mouseY && mouseY <200 )
 {special45.trigger (); rect (420,180,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 200 < mouseY && mouseY <220 )
 {special65.trigger (); rect (420,200,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 220 < mouseY && mouseY <240 )
 {special47.trigger (); rect (420,220,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 240 < mouseY && mouseY <260 )
 {special38.trigger (); rect (420,240,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 260 < mouseY && mouseY <280 )
 {special29.trigger (); rect (420,260,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 280 < mouseY && mouseY <300 )
 {special22.trigger (); rect (420,280,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 300 < mouseY && mouseY <320 )
 {special11.trigger (); rect (420,300,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 320 < mouseY && mouseY <340 )
 {special3.trigger (); rect (420,320,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 340 < mouseY && mouseY <360 )
 {special3.trigger (); rect (420,340,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 360 < mouseY && mouseY <380 )
 {special8.trigger (); rect (420,360,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 380 < mouseY && mouseY <400 )
 {special5.trigger (); rect (420,380,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 400 < mouseY && mouseY <420 )
 {special7.trigger (); rect (420,400,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 420 < mouseY && mouseY <440 )
 {special5.trigger (); rect (420,420,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 440 < mouseY && mouseY <460 )
 {special14.trigger (); rect (420,440,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 460 < mouseY && mouseY <480 )
 {special44.trigger (); rect (420,460,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 480 < mouseY && mouseY <500 )
 {special55.trigger (); rect (420,480,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 500 < mouseY && mouseY <520 )
 {special7.trigger (); rect (420,500,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 520 < mouseY && mouseY <540 )
 {special37.trigger (); rect (420,520,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 540 < mouseY && mouseY <560 )
 {special22.trigger (); rect (420,540,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 560 < mouseY && mouseY <580 )
 {special56.trigger (); rect (420,560,20,20); fill (0);}
 else if (420 < mouseX && mouseX <440 && 580 < mouseY && mouseY <600 )
 {special7.trigger (); rect (420,580,20,20); fill (0);}


//440-460
 if (440 < mouseX && mouseX < 460 && 0 < mouseY && mouseY <20 )
 {special1.trigger (); rect (440,0,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 20 < mouseY && mouseY <40 )
 {special11.trigger (); rect (440,20,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 40 < mouseY && mouseY <60 )
 {special21.trigger (); rect (440,40,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 60 < mouseY && mouseY <80 )
 {special31.trigger (); rect (440,60,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 80 < mouseY && mouseY <100 )
 {special41.trigger (); rect (440,80,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 100 < mouseY && mouseY <120 )
 {special51.trigger (); rect (440,100,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 120 < mouseY && mouseY <140 )
 {special61.trigger (); rect (440,120,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 140 < mouseY && mouseY <160 )
 {special2.trigger (); rect (440,140,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 160 < mouseY && mouseY <180 )
 {special12.trigger (); rect (440,160,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 180 < mouseY && mouseY <200 )
 {special22.trigger (); rect (440,180,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 200 < mouseY && mouseY <220 )
 {special32.trigger (); rect (440,200,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 220 < mouseY && mouseY <240 )
 {special43.trigger (); rect (440,220,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 240 < mouseY && mouseY <260 )
 {special52.trigger (); rect (440,240,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 260 < mouseY && mouseY <280 )
 {special62.trigger (); rect (440,260,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 280 < mouseY && mouseY <300 )
 {special3.trigger (); rect (440,280,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 300 < mouseY && mouseY <320 )
 {special13.trigger (); rect (440,300,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 320 < mouseY && mouseY <340 )
 {special23.trigger (); rect (440,320,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 340 < mouseY && mouseY <360 )
 {special33.trigger (); rect (440,340,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 360 < mouseY && mouseY <380 )
 {special43.trigger (); rect (440,360,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 380 < mouseY && mouseY <400 )
 {special53.trigger (); rect (440,380,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 400 < mouseY && mouseY <420 )
 {special63.trigger (); rect (440,400,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 420 < mouseY && mouseY <440 )
 {special4.trigger (); rect (440,420,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 440 < mouseY && mouseY <460 )
 {special14.trigger (); rect (440,440,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 460 < mouseY && mouseY <480 )
 {special24.trigger (); rect (440,460,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 480 < mouseY && mouseY <500 )
 {special34.trigger (); rect (440,480,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 500 < mouseY && mouseY <520 )
 {special44.trigger (); rect (440,500,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 520 < mouseY && mouseY <540 )
 {special54.trigger (); rect (440,520,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 540 < mouseY && mouseY <560 )
 {special64.trigger (); rect (440,540,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 560 < mouseY && mouseY <580 )
 {special5.trigger (); rect (440,560,20,20); fill (0);}
 else if (440 < mouseX && mouseX <460 && 580 < mouseY && mouseY <600 )
 {special5.trigger (); rect (440,580,20,20); fill (0);}


//460-480
 if (460 < mouseX && mouseX < 480 && 0 < mouseY && mouseY <20 )
 {special25.trigger (); rect (460,0,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 20 < mouseY && mouseY <40 )
 {special35.trigger (); rect (460,20,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 40 < mouseY && mouseY <60 )
 {special45.trigger (); rect (460,40,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 60 < mouseY && mouseY <80 )
 {special55.trigger (); rect (460,60,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 80 < mouseY && mouseY <100 )
 {special65.trigger (); rect (460,80,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 100 < mouseY && mouseY <120 )
 {special6.trigger (); rect (460,100,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 120 < mouseY && mouseY <140 )
 {special16.trigger (); rect (460,120,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 140 < mouseY && mouseY <160 )
 {special26.trigger (); rect (460,140,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 160 < mouseY && mouseY <180 )
 {special36.trigger (); rect (460,160,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 180 < mouseY && mouseY <200 )
 {special46.trigger (); rect (460,180,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 200 < mouseY && mouseY <220 )
 {special56.trigger (); rect (460,200,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 220 < mouseY && mouseY <240 )
 {special66.trigger (); rect (460,220,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 240 < mouseY && mouseY <260 )
 {special7.trigger (); rect (460,240,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 260 < mouseY && mouseY <280 )
 {special17.trigger (); rect (460,260,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 280 < mouseY && mouseY <300 )
 {special27.trigger (); rect (460,280,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 300 < mouseY && mouseY <320 )
 {special37.trigger (); rect (460,300,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 320 < mouseY && mouseY <340 )
 {special47.trigger (); rect (460,320,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 340 < mouseY && mouseY <360 )
 {special48.trigger (); rect (460,340,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 360 < mouseY && mouseY <380 )
 {special49.trigger (); rect (460,360,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 380 < mouseY && mouseY <400 )
 {special50.trigger (); rect (460,380,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 400 < mouseY && mouseY <420 )
 {special59.trigger (); rect (460,400,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 420 < mouseY && mouseY <440 )
 {special8.trigger (); rect (460,420,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 440 < mouseY && mouseY <460 )
 {special18.trigger (); rect (460,440,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 460 < mouseY && mouseY <480 )
 {special28.trigger (); rect (460,460,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 480 < mouseY && mouseY <500 )
 {special38.trigger (); rect (460,480,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 500 < mouseY && mouseY <520 )
 {special58.trigger (); rect (460,500,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 520 < mouseY && mouseY <540 )
 {special68.trigger (); rect (460,520,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 540 < mouseY && mouseY <560 )
 {special9.trigger (); rect (460,540,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 560 < mouseY && mouseY <580 )
 {special19.trigger (); rect (460,560,20,20); fill (0);}
 else if (460 < mouseX && mouseX <480 && 580 < mouseY && mouseY <600 )
 {special29.trigger (); rect (460,580,20,20); fill (0);}


//480-500
 if (480 < mouseX && mouseX < 500 && 0 < mouseY && mouseY <20 )
 {special39.trigger (); rect (480,0,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 20 < mouseY && mouseY <40 )
 {special49.trigger (); rect (480,20,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 40 < mouseY && mouseY <60 )
 {special59.trigger (); rect (480,40,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 60 < mouseY && mouseY <80 )
 {special10.trigger (); rect (480,60,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 80 < mouseY && mouseY <100 )
 {special30.trigger (); rect (480,80,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 100 < mouseY && mouseY <120 )
 {special35.trigger (); rect (480,100,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 120 < mouseY && mouseY <140 )
 {special35.trigger (); rect (480,120,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 140 < mouseY && mouseY <160 )
 {special46.trigger (); rect (480,140,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 160 < mouseY && mouseY <180 )
 {special25.trigger (); rect (480,160,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 180 < mouseY && mouseY <200 )
 {special62.trigger (); rect (480,180,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 200 < mouseY && mouseY <220 )
 {special53.trigger (); rect (480,200,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 220 < mouseY && mouseY <240 )
 {special4.trigger (); rect (480,220,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 240 < mouseY && mouseY <260 )
 {special64.trigger (); rect (480,240,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 260 < mouseY && mouseY <280 )
 {special42.trigger (); rect (480,260,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 280 < mouseY && mouseY <300 )
 {special31.trigger (); rect (480,280,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 300 < mouseY && mouseY <320 )
 {special41.trigger (); rect (480,300,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 320 < mouseY && mouseY <340 )
 {special62.trigger (); rect (480,320,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 340 < mouseY && mouseY <360 )
 {special1.trigger (); rect (480,340,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 360 < mouseY && mouseY <380 )
 {special52.trigger (); rect (480,360,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 380 < mouseY && mouseY <400 )
 {special2.trigger (); rect (480,380,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 400 < mouseY && mouseY <420 )
 {special14.trigger (); rect (480,400,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 420 < mouseY && mouseY <440 )
 {special62.trigger (); rect (480,420,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 440 < mouseY && mouseY <460 )
 {special63.trigger (); rect (480,440,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 460 < mouseY && mouseY <480 )
 {special31.trigger (); rect (480,460,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 480 < mouseY && mouseY <500 )
 {special63.trigger (); rect (480,480,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 500 < mouseY && mouseY <520 )
 {special3.trigger (); rect (480,500,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 520 < mouseY && mouseY <540 )
 {special31.trigger (); rect (480,520,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 540 < mouseY && mouseY <560 )
 {special34.trigger (); rect (480,540,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 560 < mouseY && mouseY <580 )
 {special43.trigger (); rect (480,560,20,20); fill (0);}
 else if (480 < mouseX && mouseX <500 && 580 < mouseY && mouseY <600 )
 {special44.trigger (); rect (480,580,20,20); fill (0);}


//500-520
 if (500 < mouseX && mouseX < 520 && 0 < mouseY && mouseY <20 )
 {special54.trigger (); rect (500,0,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 20 < mouseY && mouseY <40 )
 {special52.trigger (); rect (500,20,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 40 < mouseY && mouseY <60 )
 {special62.trigger (); rect (500,40,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 60 < mouseY && mouseY <80 )
 {special3.trigger (); rect (500,60,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 80 < mouseY && mouseY <100 )
 {special11.trigger (); rect (500,80,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 100 < mouseY && mouseY <120 )
 {special15.trigger (); rect (500,100,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 120 < mouseY && mouseY <140 )
 {special63.trigger (); rect (500,120,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 140 < mouseY && mouseY <160 )
 {special12.trigger (); rect (500,140,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 160 < mouseY && mouseY <180 )
 {special13.trigger (); rect (500,160,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 180 < mouseY && mouseY <200 )
 {special33.trigger (); rect (500,180,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 200 < mouseY && mouseY <220 )
 {special43.trigger (); rect (500,200,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 220 < mouseY && mouseY <240 )
 {special13.trigger (); rect (500,220,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 240 < mouseY && mouseY <260 )
 {special31.trigger (); rect (500,240,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 260 < mouseY && mouseY <280 )
 {special23.trigger (); rect (500,260,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 280 < mouseY && mouseY <300 )
 {special32.trigger (); rect (500,280,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 300 < mouseY && mouseY <320 )
 {special33.trigger (); rect (500,300,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 320 < mouseY && mouseY <340 )
 {special33.trigger (); rect (500,320,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 340 < mouseY && mouseY <360 )
 {special34.trigger (); rect (500,340,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 360 < mouseY && mouseY <380 )
 {special43.trigger (); rect (500,360,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 380 < mouseY && mouseY <400 )
 {special35.trigger (); rect (500,380,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 400 < mouseY && mouseY <420 )
 {special53.trigger (); rect (500,400,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 420 < mouseY && mouseY <440 )
 {special36.trigger (); rect (500,420,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 440 < mouseY && mouseY <460 )
 {special63.trigger (); rect (500,440,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 460 < mouseY && mouseY <480 )
 {special37.trigger (); rect (500,460,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 480 < mouseY && mouseY <500 )
 {special38.trigger (); rect (500,480,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 500 < mouseY && mouseY <520 )
 {special39.trigger (); rect (500,500,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 520 < mouseY && mouseY <540 )
 {special31.trigger (); rect (500,520,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 540 < mouseY && mouseY <560 )
 {special63.trigger (); rect (500,540,20,20); fill (0);}
 else if (500 < mouseX && mouseX <520 && 560 < mouseY && mouseY <580 )
 {special13.trigger (); rect (500,560,20,20); fill (0);}



//520-540
 if (520 < mouseX && mouseX < 540 && 0 < mouseY && mouseY <20 )
 {special18.trigger (); rect (520,0,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 20 < mouseY && mouseY <40 )
 {special19.trigger (); rect (520,20,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 40 < mouseY && mouseY <60 )
 {special59.trigger (); rect (520,40,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 60 < mouseY && mouseY <80 )
 {special39.trigger (); rect (520,60,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 80 < mouseY && mouseY <100 )
 {special49.trigger (); rect (520,80,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 100 < mouseY && mouseY <120 )
 {special3.trigger (); rect (520,100,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 120 < mouseY && mouseY <140 )
 {special63.trigger (); rect (520,120,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 140 < mouseY && mouseY <160 )
 {special24.trigger (); rect (520,140,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 160 < mouseY && mouseY <180 )
 {special63.trigger (); rect (520,160,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 180 < mouseY && mouseY <200 )
 {special3.trigger (); rect (520,180,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 200 < mouseY && mouseY <220 )
 {special14.trigger (); rect (520,200,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 220 < mouseY && mouseY <240 )
 {special31.trigger (); rect (520,220,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 240 < mouseY && mouseY <260 )
 {special63.trigger (); rect (520,240,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 260 < mouseY && mouseY <280 )
 {special3.trigger (); rect (520,260,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 280 < mouseY && mouseY <300 )
 {special34.trigger (); rect (520,280,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 300 < mouseY && mouseY <320 )
 {special13.trigger (); rect (520,300,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 320 < mouseY && mouseY <340 )
 {special15.trigger (); rect (520,320,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 340 < mouseY && mouseY <360 )
 {special16.trigger (); rect (520,340,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 360 < mouseY && mouseY <380 )
 {special14.trigger (); rect (520,360,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 380 < mouseY && mouseY <400 )
 {special17.trigger (); rect (520,380,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 400 < mouseY && mouseY <420 )
 {special18.trigger (); rect (520,400,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 420 < mouseY && mouseY <440 )
 {special46.trigger (); rect (520,420,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 440 < mouseY && mouseY <460 )
 {special5.trigger (); rect (520,440,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 460 < mouseY && mouseY <480 )
 {special34.trigger (); rect (520,460,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 480 < mouseY && mouseY <500 )
 {special25.trigger (); rect (520,480,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 500 < mouseY && mouseY <520 )
 {special14.trigger (); rect (520,500,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 520 < mouseY && mouseY <540 )
 {special51.trigger (); rect (520,520,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 540 < mouseY && mouseY <560 )
 {special53.trigger (); rect (520,540,20,20); fill (0);}
 else if (520 < mouseX && mouseX <540 && 560 < mouseY && mouseY <580 )
 {special52.trigger (); rect (520,560,20,20); fill (0);}



//540-560
 if (540 < mouseX && mouseX < 560 && 0 < mouseY && mouseY <20 )
 {special34.trigger (); rect (540,0,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 20 < mouseY && mouseY <40 )
 {special7.trigger (); rect (540,20,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 40 < mouseY && mouseY <60 )
 {special9.trigger (); rect (540,40,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 60 < mouseY && mouseY <80 )
 {special14.trigger (); rect (540,60,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 80 < mouseY && mouseY <100 )
 {special25.trigger (); rect (540,80,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 100 < mouseY && mouseY <120 )
 {special15.trigger (); rect (540,100,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 120 < mouseY && mouseY <140 )
 {special64.trigger (); rect (540,120,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 140 < mouseY && mouseY <160 )
 {special41.trigger (); rect (540,140,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 160 < mouseY && mouseY <180 )
 {special53.trigger (); rect (540,160,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 180 < mouseY && mouseY <200 )
 {special64.trigger (); rect (540,180,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 200 < mouseY && mouseY <220 )
 {special14.trigger (); rect (540,200,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 220 < mouseY && mouseY <240 )
 {special25.trigger (); rect (540,220,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 240 < mouseY && mouseY <260 )
 {special35.trigger (); rect (540,240,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 260 < mouseY && mouseY <280 )
 {special35.trigger (); rect (540,260,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 280 < mouseY && mouseY <300 )
 {special3.trigger (); rect (540,280,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 300 < mouseY && mouseY <320 )
 {special56.trigger (); rect (540,300,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 320 < mouseY && mouseY <340 )
 {special32.trigger (); rect (540,320,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 340 < mouseY && mouseY <360 )
 {special35.trigger (); rect (540,340,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 360 < mouseY && mouseY <380 )
 {special65.trigger (); rect (540,360,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 380 < mouseY && mouseY <400 )
 {special67.trigger (); rect (540,380,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 400 < mouseY && mouseY <420 )
 {special48.trigger (); rect (540,400,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 420 < mouseY && mouseY <440 )
 {special38.trigger (); rect (540,420,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 440 < mouseY && mouseY <460 )
 {special49.trigger (); rect (540,440,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 460 < mouseY && mouseY <480 )
 {special58.trigger (); rect (540,460,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 480 < mouseY && mouseY <500 )
 {special30.trigger (); rect (540,480,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 500 < mouseY && mouseY <520 )
 {special60.trigger (); rect (540,500,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 520 < mouseY && mouseY <540 )
 {special20.trigger (); rect (540,520,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 540 < mouseY && mouseY <560 )
 {special10.trigger (); rect (540,540,20,20); fill (0);}
 else if (540 < mouseX && mouseX <560 && 560 < mouseY && mouseY <580 )
 {special10.trigger (); rect (540,560,20,20); fill (0);}


//560-580
 if (560 < mouseX && mouseX < 580 && 0 < mouseY && mouseY <20 )
 {special34.trigger (); rect (560,0,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 20 < mouseY && mouseY <40 )
 {special64.trigger (); rect (560,20,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 40 < mouseY && mouseY <60 )
 {special14.trigger (); rect (560,40,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 60 < mouseY && mouseY <80 )
 {special31.trigger (); rect (560,60,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 80 < mouseY && mouseY <100 )
 {special32.trigger (); rect (560,80,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 100 < mouseY && mouseY <120 )
 {special33.trigger (); rect (560,100,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 120 < mouseY && mouseY <140 )
 {special34.trigger (); rect (560,120,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 140 < mouseY && mouseY <160 )
 {special35.trigger (); rect (560,140,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 160 < mouseY && mouseY <180 )
 {special36.trigger (); rect (560,160,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 180 < mouseY && mouseY <200 )
 {special37.trigger (); rect (560,180,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 200 < mouseY && mouseY <220 )
 {special38.trigger (); rect (560,200,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 220 < mouseY && mouseY <240 )
 {special13.trigger (); rect (560,220,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 240 < mouseY && mouseY <260 )
 {special15.trigger (); rect (560,240,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 260 < mouseY && mouseY <280 )
 {special25.trigger (); rect (560,260,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 280 < mouseY && mouseY <300 )
 {special26.trigger (); rect (560,280,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 300 < mouseY && mouseY <320 )
 {special3.trigger (); rect (560,300,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 320 < mouseY && mouseY <340 )
 {special16.trigger (); rect (560,320,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 340 < mouseY && mouseY <360 )
 {special25.trigger (); rect (560,340,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 360 < mouseY && mouseY <380 )
 {special4.trigger (); rect (560,360,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 380 < mouseY && mouseY <400 )
 {special5.trigger (); rect (560,380,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 400 < mouseY && mouseY <420 )
 {special34.trigger (); rect (560,400,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 420 < mouseY && mouseY <440 )
 {special55.trigger (); rect (560,420,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 440 < mouseY && mouseY <460 )
 {special64.trigger (); rect (560,440,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 460 < mouseY && mouseY <480 )
 {special34.trigger (); rect (560,460,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 480 < mouseY && mouseY <500 )
 {special54.trigger (); rect (560,480,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 500 < mouseY && mouseY <520 )
 {special24.trigger (); rect (560,500,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 520 < mouseY && mouseY <540 )
 {special62.trigger (); rect (560,520,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 540 < mouseY && mouseY <560 )
 {special17.trigger (); rect (560,540,20,20); fill (0);}
 else if (560 < mouseX && mouseX <580 && 560 < mouseY && mouseY <580 )
 {special17.trigger (); rect (560,560,20,20); fill (0);}



//580-600
 if (580 < mouseX && mouseX < 600 && 0 < mouseY && mouseY <20 )
 {special16.trigger (); rect (580,0,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 20 < mouseY && mouseY <40 )
 {special15.trigger (); rect (580,20,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 40 < mouseY && mouseY <60 )
 {special13.trigger (); rect (580,40,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 60 < mouseY && mouseY <80 )
 {special15.trigger (); rect (580,60,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 80 < mouseY && mouseY <100 )
 {special13.trigger (); rect (580,80,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 100 < mouseY && mouseY <120 )
 {special16.trigger (); rect (580,100,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 120 < mouseY && mouseY <140 )
 {special13.trigger (); rect (580,120,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 140 < mouseY && mouseY <160 )
 {special16.trigger (); rect (580,140,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 160 < mouseY && mouseY <180 )
 {special13.trigger (); rect (580,160,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 180 < mouseY && mouseY <200 )
 {special12.trigger (); rect (580,180,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 200 < mouseY && mouseY <220 )
 {special16.trigger (); rect (580,200,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 220 < mouseY && mouseY <240 )
 {special17.trigger (); rect (580,220,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 240 < mouseY && mouseY <260 )
 {special15.trigger (); rect (580,240,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 260 < mouseY && mouseY <280 )
 {special14.trigger (); rect (580,260,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 280 < mouseY && mouseY <300 )
 {special12.trigger (); rect (580,280,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 300 < mouseY && mouseY <320 )
 {special35.trigger (); rect (580,300,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 320 < mouseY && mouseY <340 )
 {special38.trigger (); rect (580,320,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 340 < mouseY && mouseY <360 )
 {special39.trigger (); rect (580,340,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 360 < mouseY && mouseY <380 )
 {special53.trigger (); rect (580,360,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 380 < mouseY && mouseY <400 )
 {special24.trigger (); rect (580,380,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 400 < mouseY && mouseY <420 )
 {special45.trigger (); rect (580,400,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 420 < mouseY && mouseY <440 )
 {special24.trigger (); rect (580,420,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 440 < mouseY && mouseY <460 )
 {special13.trigger (); rect (580,440,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 460 < mouseY && mouseY <480 )
 {special13.trigger (); rect (580,460,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 480 < mouseY && mouseY <500 )
 {special54.trigger (); rect (580,480,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 500 < mouseY && mouseY <520 )
 {special13.trigger (); rect (580,500,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 520 < mouseY && mouseY <540 )
 {special53.trigger (); rect (580,520,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 540 < mouseY && mouseY <580 )
 {special13.trigger (); rect (580,540,20,20); fill (0);}
 else if (580 < mouseX && mouseX <600 && 560 < mouseY && mouseY <600 )
 {special14.trigger (); rect (580,560,20,20); fill (0);}


}

void keyPressed() { // restart the game by clearing the screen
  if (key == CODED) {
    if (keyCode == UP) {
      background (255);} 
      else if (keyCode == DOWN) { // Prsee DOWN to have no-filled rects
        noFill ();}

  }
}




