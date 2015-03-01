
// Need G4P library
import g4p_controls.*;
import java.awt.Font;

//global variables
float volume = 100; //volume in l
float altitude = 0; //altitude over the sea [m]
float temperature = 25; //outside temperature [Â°C]
float superheat = 0; //difference of lifting gas to outside temperatuer [Â°C]
byte lifting_gas = 0; //0=He 1=Ballonium 2=H2 3=Air 4=Methan 5=N2

float lift = 102; //resulting lift in [g]

boolean update_flag = true;


public void setup() {
  size(320, 540, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
}

public void draw() {
  background(230);

  if (update_flag) {
    //updating variables

    volume = float(textfield2.getText());
    altitude = float(textfield3.getText());
    temperature = float(textfield4.getText());
    superheat = float(textfield5.getText());
    lift = float(textfield1.getText());

    float lift_gas_molar_mass = 0.004; //molar mass for helium [kg/mol]

    String lift_gas_name = "";
    switch(lifting_gas) {
    case 0:
      lift_gas_name = "Helium";
      lift_gas_molar_mass = 0.004; //molar mass Helium [kg/mol]
      break;

    case 1:
      lift_gas_name = "Ballonium";
      lift_gas_molar_mass = 0.0041; //molar mass Ballonium [kg/mol]
      break;

    case 2:
      lift_gas_name = "Hydrogen";
      lift_gas_molar_mass = 0.002; //molar mass H2 [kg/mol]
      break;

    case 3:
      lift_gas_name = "Air";
      lift_gas_molar_mass =  0.028949; //molar mass Air [kg/mol]
      break;

    case 4:
      lift_gas_name = "Methan";
      lift_gas_molar_mass =  0.01604; //molar mass Methan [kg/mol]
      break;

    case 5:
      lift_gas_name = "Nitrogen";
      lift_gas_molar_mass =  0.02802; //molar mass Methan [kg/mol]
      break;
    }



    //calculating air density
    float air_molar_mass = 0.028949; //average molar mass of air 
    float gas_constant = 8.314; //ideal gas constant

    float pressure = 101.35 * exp(-altitude/7990); //calculating air pressure in kPa for height, estimation only http://de.wikipedia.org/wiki/Luftdruck#Abnahme_mit_der_H.C3.B6he
    float air_mol_volume = (1 * gas_constant * (temperature+273.15)) / pressure; //universal gas formula: http://de.wikipedia.org/wiki/Ideales_Gas 

    float air_density = air_molar_mass / (air_mol_volume*0.001);

    //calculating lift gas density
    float lift_gas_temperature = temperature + superheat;
    float lift_gas_mol_volume = (1 * gas_constant * (lift_gas_temperature+273.15)) / pressure;

    float lift_gas_density = lift_gas_molar_mass / (lift_gas_mol_volume * 0.001);

    //calculating lift or volume 

    if (checkbox7.isSelected()) { //either update Lift or Volume
      volume = lift / (air_density - lift_gas_density);
      textfield2.setText(str(floor(volume)));
    }
    else {
      lift = (air_density - lift_gas_density) * volume;
      textfield1.setText(str(floor(lift)));
    }

    textarea1.setText("Pressure[hPa]=;" + nf(pressure*10, 1, 2) + "; Mol Air Volume[l]=;" + nf(air_mol_volume, 1, 2) + ";\nAir Density[kg/mÂ³]=;" + nf(air_density, 1, 2) + ";Mol Gas Volume[l]=;" + nf(lift_gas_mol_volume, 1, 2) + ";\nGas Density[kg/mÂ³]=;" + nf(lift_gas_density, 1, 3) + ";Gas=;"+lift_gas_name + ";\nGas Mol Mass[g/mol]=;"+nf(lift_gas_molar_mass*1000, 1, 2) + ";Lift[g]=;"+nf(lift, 1, 2) + ";\nVolume[l]=;" + nf(volume, 1, 2) + ";Altitude[m]=;" + str(round(altitude)) + ";\nTemperature[Â°C]=;"+nf(temperature,1,0)+";Superheat[Â°C]=;"+nf(superheat,1,0));
    update_flag = false;
  }//end of update if
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {

  label1.setFont(new Font("Arial", Font.PLAIN, 28));
  label2.setFont(new Font("Arial", Font.PLAIN, 20));
  label3.setFont(new Font("Arial", Font.PLAIN, 20));
  label4.setFont(new Font("Arial", Font.PLAIN, 20));
  label5.setFont(new Font("Arial", Font.PLAIN, 20));
  label6.setFont(new Font("Arial", Font.PLAIN, 20));

  textfield1.setFont(new Font("Arial", Font.PLAIN, 23));
  textfield2.setFont(new Font("Arial", Font.PLAIN, 23));
  textfield3.setFont(new Font("Arial", Font.PLAIN, 23));
  textfield4.setFont(new Font("Arial", Font.PLAIN, 23));
  textfield5.setFont(new Font("Arial", Font.PLAIN, 23));
}

/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:674616:
  
  update_flag = true;
} //_CODE_:textfield1:674616:

public void textfield2_change1(GTextField source, GEvent event) { //_CODE_:textfield2:581358:
    update_flag = true;
} //_CODE_:textfield2:581358:

public void custom_slider1_change1(GCustomSlider source, GEvent event) { //_CODE_:custom_slider1:316299:
   textfield2.setText(str(floor(custom_slider1.getValueF())));
  update_flag = true;
} //_CODE_:custom_slider1:316299:

public void textfield3_change1(GTextField source, GEvent event) { //_CODE_:textfield3:943852:
    update_flag = true;
} //_CODE_:textfield3:943852:

public void custom_slider2_change1(GCustomSlider source, GEvent event) { //_CODE_:custom_slider2:239720:
 
  textfield3.setText(str(floor(custom_slider2.getValueF())));
  update_flag = true;
} //_CODE_:custom_slider2:239720:

public void textfield4_change1(GTextField source, GEvent event) { //_CODE_:textfield4:418942:
    update_flag = true;
} //_CODE_:textfield4:418942:

public void custom_slider3_change1(GCustomSlider source, GEvent event) { //_CODE_:custom_slider3:809491:
  
  textfield4.setText(str(floor(custom_slider3.getValueF())));
  update_flag = true;
} //_CODE_:custom_slider3:809491:

public void textfield5_change1(GTextField source, GEvent event) { //_CODE_:textfield5:315544:

   update_flag = true;
} //_CODE_:textfield5:315544:

public void custom_slider4_change1(GCustomSlider source, GEvent event) { //_CODE_:custom_slider4:548807:
 
  textfield5.setText(str(floor(custom_slider4.getValueF()))); 
  update_flag = true;
} //_CODE_:custom_slider4:548807:

public void checkbox1_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox1:690664:


  if (checkbox1.isSelected()) {
    lifting_gas = 0;
    checkbox2.setSelected(false);
    checkbox3.setSelected(false);
    checkbox4.setSelected(false);
    checkbox5.setSelected(false);
    checkbox6.setSelected(false);
  }
  update_flag = true;
} //_CODE_:checkbox1:690664:

public void checkbox2_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox2:795569:
 
  if (checkbox2.isSelected()) {
    lifting_gas = 1;
    checkbox1.setSelected(false);
    checkbox3.setSelected(false);
    checkbox4.setSelected(false);
    checkbox5.setSelected(false);
    checkbox6.setSelected(false);
  }
  update_flag = true;
} //_CODE_:checkbox2:795569:

public void checkbox3_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox3:577526:
 
  if (checkbox3.isSelected()) {
    lifting_gas = 2;
    checkbox1.setSelected(false);
    checkbox2.setSelected(false);
    checkbox4.setSelected(false);
    checkbox5.setSelected(false);
    checkbox6.setSelected(false);
  }
  update_flag = true;
} //_CODE_:checkbox3:577526:

public void checkbox4_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox4:218252:
 
  if (checkbox4.isSelected()) {
    lifting_gas = 3;
    checkbox1.setSelected(false);
    checkbox2.setSelected(false);
    checkbox3.setSelected(false);
    checkbox5.setSelected(false);
    checkbox6.setSelected(false);
  }
  update_flag = true;
} //_CODE_:checkbox4:218252:

public void checkbox5_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox5:912287:
  
  if (checkbox5.isSelected()) {
    lifting_gas = 4;
    checkbox1.setSelected(false);
    checkbox2.setSelected(false);
    checkbox3.setSelected(false);
    checkbox4.setSelected(false);
    checkbox6.setSelected(false);
  }
  update_flag = true;
} //_CODE_:checkbox5:912287:

public void checkbox6_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox6:470862:
  
  if (checkbox6.isSelected()) {
    lifting_gas = 5;
    checkbox1.setSelected(false);
    checkbox2.setSelected(false);
    checkbox3.setSelected(false);
    checkbox4.setSelected(false);
    checkbox5.setSelected(false);
  }
  update_flag = true;
} //_CODE_:checkbox6:470862:

public void textarea1_change1(GTextArea source, GEvent event) { //_CODE_:textarea1:357472:
  
} //_CODE_:textarea1:357472:

public void checkbox7_clicked1(GCheckbox source, GEvent event) { //_CODE_:checkbox7:676745:

} //_CODE_:checkbox7:676745:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  textfield1 = new GTextField(this, 112, 16, 136, 32, G4P.SCROLLBARS_NONE);
  textfield1.setText("102");
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  textfield2 = new GTextField(this, 184, 80, 128, 32, G4P.SCROLLBARS_NONE);
  textfield2.setText("100");
  textfield2.setOpaque(true);
  textfield2.addEventHandler(this, "textfield2_change1");
  label1 = new GLabel(this, 8, 16, 136, 32);
  label1.setText("Lift [g] = ");
  label1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label1.setOpaque(false);
  label2 = new GLabel(this, 8, 80, 176, 32);
  label2.setText("Volume [l]");
  label2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label2.setOpaque(false);
  custom_slider1 = new GCustomSlider(this, 8, 112, 304, 24, "blue18px");
  custom_slider1.setLimits(100.0, 0.0, 2000.0);
  custom_slider1.setNbrTicks(100);
  custom_slider1.setNumberFormat(G4P.INTEGER, 0);
  custom_slider1.setOpaque(false);
  custom_slider1.addEventHandler(this, "custom_slider1_change1");
  label3 = new GLabel(this, 8, 152, 176, 32);
  label3.setText("Altitude [m]");
  label3.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label3.setOpaque(false);
  textfield3 = new GTextField(this, 184, 152, 128, 32, G4P.SCROLLBARS_NONE);
  textfield3.setText("0");
  textfield3.setOpaque(true);
  textfield3.addEventHandler(this, "textfield3_change1");
  custom_slider2 = new GCustomSlider(this, 8, 184, 304, 24, "blue18px");
  custom_slider2.setLimits(0.0, 0.0, 2000.0);
  custom_slider2.setNumberFormat(G4P.INTEGER, 0);
  custom_slider2.setOpaque(false);
  custom_slider2.addEventHandler(this, "custom_slider2_change1");
  label4 = new GLabel(this, 8, 224, 176, 32);
  label4.setText("Temperature [Â°C]");
  label4.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label4.setOpaque(false);
  textfield4 = new GTextField(this, 184, 224, 128, 32, G4P.SCROLLBARS_NONE);
  textfield4.setText("25");
  textfield4.setOpaque(true);
  textfield4.addEventHandler(this, "textfield4_change1");
  custom_slider3 = new GCustomSlider(this, 8, 256, 304, 24, "blue18px");
  custom_slider3.setLimits(25.0, -20.0, 50.0);
  custom_slider3.setNumberFormat(G4P.INTEGER, 0);
  custom_slider3.setOpaque(false);
  custom_slider3.addEventHandler(this, "custom_slider3_change1");
  textfield5 = new GTextField(this, 184, 296, 128, 32, G4P.SCROLLBARS_NONE);
  textfield5.setText("0");
  textfield5.setOpaque(true);
  textfield5.addEventHandler(this, "textfield5_change1");
  label5 = new GLabel(this, 8, 296, 176, 32);
  label5.setText("Superheat [Â°C]");
  label5.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label5.setOpaque(false);
  custom_slider4 = new GCustomSlider(this, 8, 328, 304, 24, "blue18px");
  custom_slider4.setLimits(0.0, -10.0, 200.0);
  custom_slider4.setNbrTicks(200);
  custom_slider4.setNumberFormat(G4P.INTEGER, 0);
  custom_slider4.setOpaque(false);
  custom_slider4.addEventHandler(this, "custom_slider4_change1");
  checkbox1 = new GCheckbox(this, 24, 392, 80, 16);
  checkbox1.setText("Helium He");
  checkbox1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox1.setOpaque(false);
  checkbox1.addEventHandler(this, "checkbox1_clicked1");
  checkbox1.setSelected(true);
  checkbox2 = new GCheckbox(this, 24, 408, 80, 24);
  checkbox2.setText("Ballonium");
  checkbox2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox2.setOpaque(false);
  checkbox2.addEventHandler(this, "checkbox2_clicked1");
  checkbox3 = new GCheckbox(this, 120, 392, 96, 16);
  checkbox3.setText("Hydrogen H2");
  checkbox3.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox3.setOpaque(false);
  checkbox3.addEventHandler(this, "checkbox3_clicked1");
  checkbox4 = new GCheckbox(this, 120, 408, 56, 24);
  checkbox4.setText("Air");
  checkbox4.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox4.setOpaque(false);
  checkbox4.addEventHandler(this, "checkbox4_clicked1");
  label6 = new GLabel(this, 8, 368, 160, 24);
  label6.setText("Lifting gas");
  label6.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label6.setOpaque(false);
  checkbox5 = new GCheckbox(this, 224, 392, 72, 16);
  checkbox5.setText("Methan");
  checkbox5.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox5.setOpaque(false);
  checkbox5.addEventHandler(this, "checkbox5_clicked1");
  checkbox6 = new GCheckbox(this, 224, 408, 96, 24);
  checkbox6.setText("Nitrogen N2");
  checkbox6.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox6.setOpaque(false);
  checkbox6.addEventHandler(this, "checkbox6_clicked1");
  textarea1 = new GTextArea(this, 8, 432, 304, 104, G4P.SCROLLBARS_NONE);
  textarea1.setOpaque(true);
  textarea1.addEventHandler(this, "textarea1_change1");
  checkbox7 = new GCheckbox(this, 248, 16, 72, 32);
  checkbox7.setText("fix vs. Volume");
  checkbox7.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox7.setOpaque(false);
  checkbox7.addEventHandler(this, "checkbox7_clicked1");
}

// Variable declarations 
// autogenerated do not edit
GTextField textfield1; 
GTextField textfield2; 
GLabel label1; 
GLabel label2; 
GCustomSlider custom_slider1; 
GLabel label3; 
GTextField textfield3; 
GCustomSlider custom_slider2; 
GLabel label4; 
GTextField textfield4; 
GCustomSlider custom_slider3; 
GTextField textfield5; 
GLabel label5; 
GCustomSlider custom_slider4; 
GCheckbox checkbox1; 
GCheckbox checkbox2; 
GCheckbox checkbox3; 
GCheckbox checkbox4; 
GLabel label6; 
GCheckbox checkbox5; 
GCheckbox checkbox6; 
GTextArea textarea1; 
GCheckbox checkbox7; 



