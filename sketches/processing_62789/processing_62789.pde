
// a display printing something resembling assembly code
class AssemblyDisplay extends Display {
  int rowHeight = 6;
  
  int nbrRows;
  int count=0;
  String[] instructions; 
  String[] registers;      //the idea was to use only one string per row and aligning things
                           //with \t, but it doesn't seem to work with text()

  AssemblyDisplay(int x, int y, int w, int h, int mHue) {
    super(x, y, w, h, mHue);
    nbrRows = (h-2*margin)/rowHeight;
    instructions = new String[nbrRows];
    registers = new String[nbrRows];
    generate();
  }

  void generate() {
    for (int i = 0; i < nbrRows; i++) {
      instructions[i] = pickInstruction();
      registers[i] = (random(1)<0.5) ? pickRegister() + ", " + pickRegister() : pickRegister();
    }
  }

  String pickInstruction() {
    int type = int(random(0, 10));
    switch (type) {
    case 0: 
      return "MOV";
    case 1: 
      return "PUSH";
    case 2: 
      return "OUT";
    case 3: 
      return "JNA";
    case 4: 
      return "INC";
    case 5: 
      return "LOOP";
    case 6: 
      return "POP";
    case 7: 
      return "DEC";
    case 8: 
      return "MOVQ";
    default: 
      return "RET";
    }
  }

  String pickRegister() {
    int type = int(random(0, 4));
    switch (type) {
    case 0: 
      return "eax";
    case 1: 
      return "ebx";
    case 2: 
      return "ecx";
    default: 
      return "edx";
    }
  }

  void update() {
    count++;
    if (count > nbrRows+30) {
      if (random(1)<0.7) {
        count = 0;
        generate();
      } 
      else {
        changeStatus = CHANGE_FORCED;
      }
    }
  }
  void draw(float hue, float sat, float bri) {
    for (int i = 0; i < min(count,nbrRows); i++) {
      img.textFont(tinyFont);
      img.fill(hue, sat, bri);
      img.textAlign(LEFT, TOP);
      img.text(instructions[i], margin, margin + i*rowHeight);
      img.text(registers[i], margin+20, margin + i*rowHeight);
    }
  }
}


