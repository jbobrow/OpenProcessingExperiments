
import com.temboo.core.*;
import com.temboo.Library.NYTimes.RealEstate.*;
PFont myFont;
int[] countArray;
color f=0;


//JSONArray incomData;
// Create a session using your Temboo account application details
TembooSession session = new TembooSession("cstiles", "myFirstApp", "efd8e2eb76bb4136956b7ee28e6d12b7");

void setup() {
  background(255);
  size (600, 800);
  noStroke();
  frameRate(120);

  // Run the GetSalesCounts Choreo function
  runGetSalesCountsChoreo();
  drawManhattan();
}

void runGetSalesCountsChoreo() {
  // Create the Choreo object using your Temboo session
  GetSalesCounts getSalesCountsChoreo = new GetSalesCounts(session);

  // Set inputs
  getSalesCountsChoreo.setDateRange("2009-Q1");
  getSalesCountsChoreo.setAPIKey("fe6c11aa890753dcffdaa45396275d0a:7:69320483");
  getSalesCountsChoreo.setGeoSummaryLevel("neighborhood");
  getSalesCountsChoreo.setGeoExtentLevel("borough");
  getSalesCountsChoreo.setGeoExtentValue("Manhattan");

  // Run the Choreo and store the results
  GetSalesCountsResultSet getSalesCountsResults = getSalesCountsChoreo.run();
  String salesResponse = getSalesCountsResults.getResponse();
  JSONObject incomData =  JSONObject.parse(salesResponse);
  JSONArray results = incomData.getJSONArray("results");
  int resultSize = results.size();
  countArray = new int[resultSize]; 
  for (int i=0;i< results.size(); i++)
  {
    JSONObject places = results.getJSONObject(i);
    //println(places);
    String neighborhood = places.getString("neighborhood");
    int count = places.getInt("count");
    countArray[i] = count;

    myFont = createFont("STONIN__.TTF", 23);
    textFont(myFont);
    fill(f);
    text(neighborhood, 38, 25+25*i);
    println(neighborhood, count);
    fill(255, 150, 150);
    textAlign(CENTER);

    text("Number of RealEstate Listings \n in New York Times",470, 50);
    textAlign(LEFT);
  }
}

void draw() {
  myFont = createFont("STONIN__.TTF", 100);
  textFont(myFont);

  if (mouseX > 25 && mouseX<160)
  { 
    if (mouseY > 0 && mouseY < 24) //Battery Park City
    {
      drawManhattan();//this erases what was before 

      fill(255, 150, 150);//PINKKKK
      ellipse(347, 698, 10, 10); //this is the pink dot on the map
      text(countArray[0], 450, 200);//this is the number of places to live
    } 
    else if (mouseY > 25 && mouseY < 49) //Carnegie Hall (shoutout to andrew carnegie)
    {
      drawManhattan(); 

      fill(255, 150, 150);
      ellipse(370, 345, 20, 20); 
      text(countArray[1], 450, 200);
    } 
    else if (mouseY > 51 && mouseY < 74)// chelsea
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(317, 550, 30, 30);
      text(countArray[2], 450, 200);
    }
    else if (mouseY > 76 && mouseY < 99)//eastern Harlem
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(390, 255, 25, 25);
      text(countArray[3], 450, 200);
    }
    else if (mouseY > 101 && mouseY < 124)// east village
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(440, 590, 10, 10);
      text(countArray[4], 450, 200);
    }
    else if (mouseY > 126 && mouseY < 149)// financial district
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(375, 705, 20, 20);
      text(countArray[5], 450, 200);
    }
    else if (mouseY > 151 && mouseY < 174)// flatiron
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(375, 550, 10, 10);
      text(countArray[6], 450, 200);
    }
    else if (mouseY > 176 && mouseY < 199)// Gramercy
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(399, 560, 20, 20);
      text(countArray[7], 450, 200);
    }
    else if (mouseY > 201 && mouseY < 224)// Hamilton heights
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(265, 190, 20, 20);
      text(countArray[8], 450, 200);
    }
    else if (mouseY > 226 && mouseY < 249)// Harlem
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(330, 245, 25, 25);
      text(countArray[9], 450, 200);
    }
    else if (mouseY > 251 && mouseY < 274)// Hudson Heights
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(263, 84, 10, 10);
      text(countArray[10], 450, 200);
    }
    else if (mouseY > 276 && mouseY < 299)// Kips Bay
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(430, 535, 10, 10);
      text(countArray[11], 450, 200);
    }
    else if (mouseY > 301 && mouseY < 324)// Lower east side
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(460, 630, 15, 15);
      text(countArray[12], 450, 200);
    }
    else if (mouseY > 326 && mouseY < 349)// Manhattan Valley
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(265, 230, 10, 10);
      text(countArray[13], 450, 200);
    }
    else if (mouseY > 351 && mouseY < 374)// Midtown East
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(380, 465, 10, 10);
      text(countArray[14], 450, 200);
    }
    else if (mouseY > 376 && mouseY < 399)// midtown west
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(345, 450, 10, 10);
      text(countArray[15], 450, 200);
    }
    else if (mouseY > 401 && mouseY <424)// morningside heights
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(265, 265, 20, 20);
      text(countArray[16], 450, 200);
    }
    else if (mouseY > 426 && mouseY < 449)// mt.morris park
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(356, 255, 10, 10);
      text(countArray[17], 450, 200);
    }
    else if (mouseY > 451 && mouseY < 474)// Murray Hill
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(450, 560, 10, 10);
      text(countArray[18], 450, 200);
    }
    else if (mouseY > 474 && mouseY < 499)// noho
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(399, 600, 10, 10);
      text(countArray[19], 450, 200);
    }
    else if (mouseY > 501 && mouseY < 524)// seaport
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(415, 675, 10, 10);
      text(countArray[20], 450, 200);
    }
    else if (mouseY > 526 && mouseY < 549)// soho
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(355, 630, 20, 20);
      text(countArray[21], 450, 200);
    }
    else if (mouseY > 551 && mouseY < 574)// sugar hill
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(305, 173, 12, 12);
      text(countArray[22], 450, 200);
    }
    else if (mouseY > 576 && mouseY < 599)// tribecca
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(367, 660, 15, 15);
      text(countArray[23], 450, 200);
    }
    else if (mouseY > 601 && mouseY < 624)// union square
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(400, 555, 10, 10);
      text(countArray[24], 450, 200);
    }
    else if (mouseY > 626 && mouseY < 649)//upper east side
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(370, 385, 15, 15);
      text(countArray[25], 450, 200);
    }
    else if (mouseY > 651 && mouseY < 674)// upper west side
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(280, 385, 25, 25);
      text(countArray[26], 450, 200);
    }
    else if (mouseY > 676 && mouseY < 699)// village
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(420, 620, 10, 10);
      text(countArray[27], 450, 200);
    }
    else if (mouseY > 701 && mouseY < 724)// washington heights
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(275, 130, 15, 15);
      text(countArray[28], 450, 200);
    }
    else if (mouseY > 726 && mouseY < 749)// west village
    {
      drawManhattan();
      fill(255, 150, 150);
      ellipse(317, 600, 15, 15);
      text(countArray[29], 450, 200);
    }
  }

    else {
      drawManhattan();
    }


}


void drawManhattan() {
  fill(255);
  rect(400, 120, 180, 100);
  image(loadImage("manhatten.png"), 50, -23, width, height);
}



