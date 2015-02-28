
// must be at the top
import promidi.*;
MidiIO midiIO;
int num, val ;
// data class
ObjectControl objctrl ;
int numObject = 3 ;

//for read the saveSetting
String midiJoin ;
//create the doors for each object can be setting with Midi console
int [] IDmidi = new int [numObject] ;

//data misc
color c ;

void setup()
{

  //Screen
  size ( 200,200 ) ;
  
  c = color (255, 30, 30) ;
  objctrl = new ObjectControl() ;
  
  //MIDI
  //get an instance of MidiIO
  midiIO = MidiIO.getInstance(this);
  //open the first midi channel of the first device
  midiIO.openInput(0,0);
  //Loading midi setting
  String [] midi = loadStrings ("midi/saveMidi.txt") ;
  println(midi) ;
  midiJoin = join(midi, ",") ;
  println(midiJoin) ;
  
  
  //add objet
  addObject() ;
}

void draw()
{
  background (0) ;
  //
  objctrl.display(midiJoin, num, val ) ;
  objctrl.settingMidi(num) ;
  
}
void mousePressed()
{
  objctrl.clic() ;
}

//ADD OBJECT
void addObject()
{
  for (int i = 0 ; i < numObject ; i++ ) {
    int startingVal = 0 ;
    PVector pos = new PVector (width/2.0 , height /4.0 + i*(height /4.0) );
    PVector sizeObj = new PVector( 15.0 , 15.0 ) ;
    int x = width /2 ;
    int y = height / 4 + i*(height / 4) ;
    objctrl.addObject(pos, sizeObj, c, startingVal) ; 
  }
}

//MIDI
void controllerIn(Controller controller, int device, int channel){
  num = controller.getNumber();
  val = controller.getValue();
}

void keyPressed()
{
  objctrl.keyPressed() ;
}


///////CLASS OBJECT CONTROL////////////////////////////////
class ObjectControl
{
  ArrayList<Object> listObject ;
 //MIDI load, save...
 boolean saveMidi, loadingDefaultMidiSetting ;
  
  
  //constructor
  ObjectControl() 
  { 
    listObject = new ArrayList<Object> () ;
  }
  
  ////
  void addObject(PVector pos, PVector sizeObj,color c, int startingVal)
  {
    Object obj = new Object(pos, sizeObj, c)     ; listObject.add(obj) ;
  //  Value v = new Value(startingVal) ; listVal.add(v) ;
  }
  ////
  void display(String midiSaveJoin, int num, int val)
  {
    float normVal = map(val,1,128, 0, width ) ;
    String[] IDmidiSave = midiSaveJoin.split(",");
    
    for ( int i = 0 ; i < listObject.size() ; i++ ) {
      Object obj = (Object) listObject.get(i) ;
      //give which button is active and check is this button have a same IDmidi that Object
      if ( num == obj.IDmidi() ) obj.updateMidi(normVal) ;
      
      obj.display() ;
      obj.update() ;
      
      //SAVE
      //to add an IDmidi from the save to object
      if (!loadingDefaultMidiSetting) { 
        obj.selectIDmidi(int(IDmidiSave[i])) ;
      }
      
      //MIDI
      //to add an IDmidi from the internal setting to object
      if (obj.lock() ) obj.selectIDmidi(num) ;
    }
    //to stop the reading save midi setting
    loadingDefaultMidiSetting = true ;
  }
  
  
  //Midi setting
  void settingMidi(int num)
  {
    fill(c) ;
    text ("select Midi button(s)", width/2 -60,20 ) ;
    text ("to save press «s» ", width/2 -45, height-10 ) ;
    String [] newSettingMidi = new String[listObject.size()] ;
    
    for ( int i = 0 ; i < listObject.size() ; i++ ) {
      Object obj = (Object) listObject.get(i) ;
      newSettingMidi[i] = "" + obj.IDmidi() ;
    }
    if ( saveMidi ) saveStrings("data/midi/saveMidi.txt", newSettingMidi) ; saveMidi = false ;
  }
  
  //to save the midi setting
  void keyPressed() {
    if (key == 's' || key == 'S' ) saveMidi = true ;
  }
  
  //to switch the button ON / OFF
  void clic()
  {
    for ( int i = 0 ; i < listObject.size() ; i++ ) {
      Object obj = (Object) listObject.get(i) ;
      obj.clic() ;
    }
  }
}

//////////////SUPER CLASS OBJECT/////////
class Object 
{
  color c ;
  PVector pos, sizeObj ;
  int IDmidi = -2 ;
  Boolean inside =false ;
  Boolean locked =false ;
  Object(PVector pos, PVector sizeObj, int c) {
    this.pos = pos ; this.sizeObj = sizeObj ;
    this.c = c ; 
  }
  ////
  void display() {
    
    //check the state of the button
    if (inside) fill(255) ; else fill(c) ;
    if (locked) fill(100) ;
    
    //display the objet
    text(IDmidi, pos.x +12,pos.y +5) ;
    ellipse(pos.x, pos.y, sizeObj.x, sizeObj.y) ;
  }
  void update()
  {
    if ( detection(pos) ) inside = true ; else inside = false ;
  }
  // update position from midi controller
  void updateMidi(float val)
  {
    pos.x = val ;
  }
  // give the ID from the controller Midi
  void selectIDmidi(int num)
  { 
    IDmidi = num ;
  }

  
  //Switch the button ON/OFF
  void clic()
  {
    if ( inside  ) {
      if (!locked) locked =true ; else locked = false ;
    }
  }
  
  //RETURN
  boolean lock()
  {
    return locked ;
  }
  int IDmidi() {
    return IDmidi ;
  }
  //to see if the cursor is on the area or not
  boolean detection(PVector pos) {
    PVector cor = new PVector (sizeObj.x /2.0, sizeObj.y /2.0 ) ;
    if(mouseX > pos.x -cor.x && mouseX < pos.x + cor.x && mouseY > pos.y - cor.y && mouseY < pos.y + cor.y) {
      return true;
    } else {
      return false;
    }
  }
}





