
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/117381*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/**
 <h1>QScript algorithm editor</h1>
 <p>There are 3 predefined scripts dmonstrating solutions to simple math 
 algorithms. To execute one of these scripts click on one of the green 
 buttons, then click on the Init button, this will parse and tokenise 
 the script. </p>
 
 <p>In the event of a syntax error it will be highlighted in red and a 
 description will appear in the pink status bar. </p>
 
 <p>It is not possible to run the script until it has been successfully 
 tokenised. At that time you can click on the start button, slect whether you 
 want to trace the progress of the evaluation and if tracing the speed of 
 evaluation.</p>
 
 <p>To run your own scripts simply type them into the script editor and then
 initialise and run them.</p>
 
 <p>You can see all the operators/functions available  
 <a href="http://www.lagers.org.uk/qscript/operatorset.html" target="_blank">here</a>. </p>
 <br/><br/>
 
 KEYS <br/>
 S - stops evaluating the script <br/>
 P - pause evaluating the scrpt <br/>
 R - resumes a paused script or advances if in step mode <br/>
 
 */

import org.qscript.eventsonfire.*;
import org.qscript.events.*;
import org.qscript.editor.*;
import org.qscript.*;
import org.qscript.operator.*;
import org.qscript.errors.*;

import g4p_controls.*;

import java.util.*;
import java.awt.*;

final int READY = 2;
final int RUNNING = 3;
int currMode;

Script script;
String code[];
boolean codeChanged = false;
TreeMap<String, String> store = new TreeMap<String, String>();
LinkedList<ScriptEvent> event_queue = new LinkedList<ScriptEvent>();

StringBuilder output = new StringBuilder();

public void setup() {
  size(600, 570, JAVA2D);
  createGUI();
  customGUI();
  // Set the script to start with
  script = new Script("");
  setScript(1);
  // Set the script trace and trace delays based on initial GUI settings
  script.traceDelay(sdrDelay.getValueI());
  setTraceGUIvisible(cbxTrace.isSelected());

  // Scripting events are to be sent to this object
  script.addListener(this);

  goToMode(READY);
  registerMethod("pre", this);
}

public void keyTyped() {
  if (script != null) {
    if (key == 'p' || key == 'P')
      script.waitFor(0);
    else if (key == 'r' || key == 'R') 
      script.resume();
    else if (key == 's' || key == 'S') 
      script.stop();
  }
}

// Switch IDE between running and editing modes
public void goToMode(int mode) {
  switch(mode) {
  case READY:
    currMode = mode;
    btnStart.setAlpha(255);
    btnStop.setAlpha(120);
    break;
  case RUNNING:
    currMode = mode;
    btnStart.setAlpha(120);
    btnStop.setAlpha(255);
    break;
  }
}  

// Clear the data store of all variables
public void clearVars() {
  store.clear();
  txaVars.setText("");
  if (script != null)
    script.clearVariables();
}

// Hide/show trace controls depending on whether trace is switched
// on or off.
public void setTraceGUIvisible(boolean traceOn) {
  if (script != null) {
    lblDelayTitle.setVisible(traceOn);
    sdrDelay.setVisible(traceOn);
    lblDelayTitle.setVisible(traceOn);
    cbxStep.setVisible(traceOn);
  }
}

/**
 * Since events are fired asynchronously this method might be called whilst G4P
 * is drawing its controls causing the program to crash. To avoid this we will
 * add the event to a queue and process it during Processing's event loop.
 */
@EventHandler
public void onScriptEvent(ScriptEvent event) {
  if (event instanceof HaltExecutionEvent && event.etype == ErrorType.STOPPED_BY_USER)
    event_queue.addFirst(event);
  else
    event_queue.addLast(event);
}

/**
 * This method has been registered with Processing so will be called just 
 * before the draw method. It will process a maximum of 20 events in the FIFO
 * queue, then allow the draw method to execute.
 * Since the script can generate hundreds of events per frame we have to
 * cap the number processed if we want the GUI to be responsive.
 */
public void pre() {
  int count = 0;
  while (!event_queue.isEmpty () && count++ < 20)
    performEventAction(event_queue.removeFirst());
}

/**
 * This method performs the actions needed by any particular type of script 
 * event. 
 */
public void performEventAction(ScriptEvent event) {
  if (event instanceof ParseTokenEvent && cbxTrace.isSelected()) {
    txaScript.clearStyles();
    txaScript.addStyle(G4P.BACKGROUND, 0xFF0000CC, event.lineNo, event.pos, event.pos + event.width);
    txaScript.addStyle(G4P.FOREGROUND, 0xFFFFFF00, event.lineNo, event.pos, event.pos + event.width);
    txaScript.moveCaretTo(event.lineNo, event.pos);
  } 
  else if (event instanceof ParseErrorEvent || event instanceof EvaluationErrorEvent) {
    lblStatus.setText(event.getMessage());
    txaScript.clearStyles();
    txaScript.addStyle(G4P.BACKGROUND, 0xFFFF0000, event.lineNo, event.pos, event.pos + event.width);
    txaScript.addStyle(G4P.FOREGROUND, 0xFFFFFFFF, event.lineNo, event.pos, event.pos + event.width);
    txaScript.addStyle(G4P.WEIGHT, 4, event.lineNo, event.pos, event.pos + event.width);
    txaScript.moveCaretTo(event.lineNo, event.pos);
    goToMode(READY);
  } 
  else if (event instanceof HaltExecutionEvent) {
    lblStatus.setText(event.getMessage());
    event_queue.clear();
    txaScript.clearStyles();
    txaScript.addStyle(G4P.BACKGROUND, 0xFFFF0000, event.lineNo, event.pos, event.pos + event.width);
    txaScript.addStyle(G4P.FOREGROUND, 0xFFFFFFFF, event.lineNo, event.pos, event.pos + event.width);
    txaScript.addStyle(G4P.WEIGHT, 4, event.lineNo, event.pos, event.pos + event.width);
    goToMode(READY);
  } 
  else if (event instanceof ScriptFinishedEvent) {
    lblStatus.setText(event.getMessage());
    event_queue.clear();
    txaScript.clearStyles();
    goToMode(READY);
  } 
  else if (event instanceof OutputEvent) {
    output.append(event.getMessage());      
    txaOutput.setText(output.toString(), 2000);
  } 
  else if (event instanceof StoreUpdateEvent) {
    Variable var = (Variable) event.extra;
    store.put(var.getIdentifier(), var.toString());
    StringBuilder s = new StringBuilder();
    for (String id : store.keySet()) {
      if (id.length() > 12) {
        s.append(id.substring(0, 9));
        s.append("...   ");
      }
      else {
        s.append(id);
        s.append("               ".substring(0, 15 - id.length()));
      }
      s.append(store.get(id));
      s.append("\n");
    }
    txaVars.setText(s.toString());
  }
  else if (event instanceof WaitEvent) {
    Argument arg = (Argument) event.extra;
    int time = arg.toInteger();
    if (time == 0)
      lblStatus.setText("Waiting for you to resume ... ");
    else
      lblStatus.setText("Waiting for " + time + " milliseconds");
  }
}

public void draw() {
  background(230, 230, 255);
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
  //  lblStatus.setTextAlign(GAlign.LEFT, null);
  txaVars.setFont(new Font("Monospaced", Font.PLAIN, 11));
  txaOutput.setFont(new Font("Dialog", Font.PLAIN, 11));
  txaScript.setFont(new Font("Monospaced", Font.PLAIN, 12));
  txaVars.setTextEditEnabled(false);
  txaOutput.setTextEditEnabled(false);
}

