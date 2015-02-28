
XMLElement xml;

int maxChildren, i = 0;
XMLElement[] xml_data;

//
PVector acc_data;
float x_acc, y_acc, z_acc, acc_r;

//
PVector mag_data;
float x_mag, y_mag, z_mag, mag_r;

//
PVector imu_gyro, imu_acc, imu_mag;

//
float gsr;

//
float[] foot_left = new float[2];
float[] foot_right = new float[2];
float feet_sum;

//
float[] gps = new float[4];

//
float[] heart = new float[3];

//
float[] air_time = new float[2];
String air_time_landed;

void setup()  {

  size (420, 380);
//  xml = new XMLElement (this, "RawLog.xml"); // Terje
  xml = new XMLElement (this, "Lundstrom_RawLog.xml"); // Tor Lundstrom 
  xml_data = xml.getChildren();
  maxChildren = xml.getChildCount();

//  println(xml_data[0].getName());

}

void draw()
{
  background(0,0,0);
  
  XMLElement child_element = xml.getChild(i);

  //
  //  A C C _ D A T A 
  //  
  
  if (child_element.getName().equals("acc_data"))  {

    x_acc = child_element.getFloatAttribute("x");
    y_acc = child_element.getFloatAttribute("y");
    z_acc = child_element.getFloatAttribute("z");
    acc_r = child_element.getFloatAttribute("r");
     
    //  
    acc_data = new PVector(x_acc, y_acc, z_acc); 
  }

  //
  //  M A G _ D A T A
  //

  if (child_element.getName().equals("mag_data"))  {
    
    x_mag = child_element.getFloatAttribute("x");
    y_mag = child_element.getFloatAttribute("y");
    z_mag = child_element.getFloatAttribute("z");
    mag_r = child_element.getFloatAttribute("r");
      
    mag_data = new PVector(x_mag, y_mag, z_mag);
  }  

  
  //
  //  I M U _ D A T A
  //

  if (child_element.getName().equals("imu_data"))  {
  
    // G Y R O
    //
    String gyro_string = child_element.getChild("gyro").getContent();
    String[] gyro_list = split(gyro_string, ',');
    imu_gyro = new PVector(float(gyro_list[0]), float(gyro_list[1]), float(gyro_list[2]));
    
    //  A C C   
    String acc_string = child_element.getChild("acc").getContent();
    String[] acc_list = split(acc_string, ',');
    imu_acc = new PVector(float(acc_list[0]), float(acc_list[1]), float(acc_list[2]));

    //  M A G
    String mag_string = child_element.getChild("mag").getContent();
    String[] mag_list = split(mag_string, ',');
    imu_mag = new PVector(float(mag_list[0]), float(mag_list[1]), float(mag_list[2]));    

  }
  
  //
  //  G S R 
  //
  if (child_element.getName().equals("gsr_data"))  {
    
    gsr = child_element.getFloatAttribute("reading");
  }


  //
  //  F E E T  +  F O O T S
  //

  if (child_element.getName().equals("foot_data"))  {
    
    if (child_element.getStringAttribute("side").equals("L"))  {
      // Left Side
      foot_left[0] = child_element.getFloatAttribute("toes");
      foot_left[1] = child_element.getFloatAttribute("heel");
    } else  {
      foot_right[0] = child_element.getFloatAttribute("toes");
      foot_right[1] = child_element.getFloatAttribute("heel");    
    }
  }
  
  if (child_element.getName().equals("feet_sum"))  {
    feet_sum = child_element.getFloatAttribute("sum");
  }
  
  //
  //  G P S 
  //

  if (child_element.getName().equals("gps_data"))  {
    
    gps[0] = child_element.getFloatAttribute("longitude");
    gps[1] = child_element.getFloatAttribute("latitude");
    gps[2] = child_element.getFloatAttribute("altitude");
    gps[3] = child_element.getFloatAttribute("ground_speed");    
  }

  //
  //  H E A R T
  //

  if (child_element.getName().equals("heart_data"))  {

      heart[0] = child_element.getFloatAttribute("last32");
      heart[1] = child_element.getFloatAttribute("last16");
      heart[2] = child_element.getFloatAttribute("lastBeat");    
  }

  //
  //   A I R 
  //

  if (child_element.getName().equals("air_time"))  {
  
    air_time[0] = child_element.getFloatAttribute("in_air");
    air_time[1] += air_time[0]; // Total air Time
    
    air_time_landed = child_element.getStringAttribute("landed");
    
    if (air_time_landed.equals("true"))  {
      air_time[1] = 0;    
    }
  }



  //
  //
  //
  //  O U T  P U T
  //
  //
  //

  text( "Node Name : " + xml.getChild(i).getName() + " " , 10, 20);
  text( "Timestamp  : " + xml.getChild(i).getStringAttribute("tstamp") + " ", 10, 45);
  
  text( "Node No : " + i + "/" + maxChildren, 10, 70);

  text("acc_data : " + acc_data + " acc_r : " + acc_r , 10, 100);
  text("mag_data : " + mag_data + " mag_r : " + mag_r, 10, 120);
  text("imu_gyro : " + imu_gyro, 10, 140);
  text("imu_acc : " + imu_acc, 10, 160);
  text("imu_mag : " + imu_mag, 10, 180);
  
  text("foot_l : " + foot_left[0] +"/ " + foot_left[1], 10, 200);
  text("foot_r : " + foot_right[0] + "/" + foot_right[1]+ "", 10, 220);
  text("feet : " + feet_sum, 10, 240);
  text("gps : " + gps[0] + "/ " + gps[1] + "/ " + gps[2] + "/ " + gps[3], 10, 260);
  text("heart : " + heart[0 ]+ "/ "+ heart[1] + "/ " + heart[2], 10, 280);
  text("gsr : " + gsr, 10, 300);
  text("air_time : " + air_time[0]+ "/ " + air_time[1] + " /" + air_time_landed, 10, 320);

    /* If landed == true wipe in_air float val */
  
  if ( i > maxChildren )  {
    println("XML Finished");
    noLoop();  
  }

  i++;
  
  if (i >= maxChildren)  i = 0;
  
}

