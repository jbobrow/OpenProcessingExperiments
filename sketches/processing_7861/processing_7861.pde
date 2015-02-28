
import controlP5.*;

ControlP5 controlP5;
RadioButton radio;
Slider slider;
Range range;

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup() && theEvent.group().name().equals("mode_radio")) {
    if ((int)theEvent.group().arrayValue()[0] == 1) {
      canvas = new LetterCanvasMask(img, INITIAL_START_SIZE[0], INITIAL_END_SIZE[0]);
      range.setLowValue(INITIAL_END_SIZE[0]);
      range.setHighValue(INITIAL_START_SIZE[0]);
    } else if ((int)theEvent.group().arrayValue()[1] == 1) {
      canvas = new LetterCanvasOneColor(img, INITIAL_START_SIZE[1], INITIAL_END_SIZE[1]);
      range.setLowValue(INITIAL_END_SIZE[1]);
      range.setHighValue(INITIAL_START_SIZE[1]);
    } else if ((int)theEvent.group().arrayValue()[2] == 1) {
      canvas = new DotCanvas(img, INITIAL_START_SIZE[2], INITIAL_END_SIZE[2]);
      range.setLowValue(INITIAL_END_SIZE[2]);
      range.setHighValue(INITIAL_START_SIZE[2]);
    }    
  } else if(theEvent.isController()) {
    String name = theEvent.controller().name();
    if (name.equals("Stop")) {
      canvas.stop();
    }
    else if (name.equals("Start")) {
      canvas.start();
    }
    else if (name.equals("Clear")) {
      canvas.clear();
    }
    else if (name.equals("Save")) {
      canvas.save("output.png");
    }
    else if (name.equals("particle_size")) {
      canvas.stop();
      canvas.setStartSize((int)theEvent.controller().arrayValue()[1]);
      canvas.setEndSize((int)theEvent.controller().arrayValue()[0]);
      canvas.clear();
    }
  }
}

