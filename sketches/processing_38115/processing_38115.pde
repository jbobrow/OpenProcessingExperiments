
import controlP5.*;
ArrayList<ArrayList <String>> table;
PImage labmap;
PImage rightarrow;
String alert = "";
PImage leftarrow;
PImage zoomButton;
PImage tableButton;
ArrayList<String> tabular;
int view = 1;
float labelX, labelY;
int minHere = -333;
int maxHere = -333;
boolean zoom = false;

//************************************************* Notice the Following *****************************************************************************************************
// There are several views in this  visualization
// View 1: map showing temperatures of each room
// View 2: Graph of tempaertures on a certain day
// View 3: Graph of temperatures in a certain month
// View 4: Graph of tempeartures in a certain year
// View 5: Graph of average temperatures of the same month in the different years
// View 6: Graph of temperatures of a certain month compared to the high, low outside

ControlP5 controlP5;
DropdownList p1, p2, p3;
boolean showing = false;
int days = 31;
int years = 7;
int daySelected = 1;
String monthSelected = "August";
int yearSelected = 2005;
String timeSelected = "12:00";
String ampm = "AM";
int t1 = 71;
int t2 = 72;
int t3 = 71;
int t4 = 71;
int t5 = 72; 
int t6 = 72;
int t7 = 65;
int mintemp = 32;
int maxtemp = 92;
int plotX1, plotX2, plotY1, plotY2;
int roomSelected= 0;
float[] tabLeft, tabRight;
float tabTop, tabBottom;
float tabPad = 10;
ArrayList<ArrayList<String>> outside;
ArrayList<Integrator[]> interpolatorsList;
void setup() {
  
  // The interpolators list has already reserved arrays to save the different interpolators used when graphing. Since there is more than one view, different arrays of different sizes are needed
  interpolatorsList = new ArrayList<Integrator[]>();


	size(1024, 700);

// The different images needed are loaded
	labmap = loadImage("evl_2nd_floor.jpg");
	rightarrow = loadImage("right-arrow.png");
	leftarrow = loadImage("left-arrow.png");
	zoomButton = loadImage("zoom_lens_icon.png");
        tableButton = loadImage("table-icon.png");

// Preparing graph dimensions        
        plotX1 = 140;
	plotX2 = width-75;
	plotY1 = 40;
	plotY2 = height-230;
	labelX = 50;
	labelY = height-185; 
	smooth();

	// Working on drop down menu
	frameRate(10);
	controlP5 = new ControlP5(this);

	p1 = controlP5.addDropdownList("Choose Month", 160, 600, 200, 120);
	p1.captionLabel().set("Choose a Month");
	customize(p1);
	p1.addItem("January", 1);
	p1.addItem("February", 2);
	p1.addItem("March", 3);
	p1.addItem("April", 4);
	p1.addItem("May", 5);
	p1.addItem("June", 6);
	p1.addItem("July", 7);
	p1.addItem("August", 8);
	p1.addItem("September", 9);
	p1.addItem("October", 10);
	p1.addItem("November", 11);
	p1.addItem("December", 12);

	p2 = controlP5.addDropdownList("Choose Day", 380, 600, 200, 120);
	p2.captionLabel().set("Choose a Day"); 
	for (int i = 1; i<32;i++) {
		p2.addItem(""+i, i);
	}
	customize(p2);
	p3 = controlP5.addDropdownList("Choose Year", 600, 600, 200, 120);
	p3.captionLabel().set("Choose a Year");  
	for (int i = 5; i< 12;i++) {
		int yr = 2000+i;
		p3.addItem(""+ yr, i-4);
	}
	customize(p3);

	//Extracting the data and preparing the table
	
        String[] rowsin = loadStrings("history-sched-days.tsv"); 
	int rowsinno = rowsin.length;
	outside = new ArrayList<ArrayList<String>>();
	table = new ArrayList<ArrayList<String>>();
	
        // Each row in the table has 11 columns
	// Column 1: Day
	// Column 2: Date 
	// Column 3: time 
	// Column 4: AM/PM 
	// Then, we have the temperatures as follows: 
	// Column 5: 3B00080058124B10 - meeting room - 1 
	// Column 6: 73000800B1D9BD10 - main lab - 2 
	// Column 7: DB000800B1E8E710 - machine room - 3 
	// Column 8: F2000800B1D88510 - lounge - 4 
	// Column 9: 35000800B1EC2510 - prototype space - 5 
	// Column 10: DB00080041634E10 - classroom - 6 
	// Column 11: FF00080057FB1810 - office space - 7 }

	for (int i = 0; i < rowsinno; i++) { 
		String[] tempStrArr = rowsin[i].split(" "); 
		ArrayList<String> row = new ArrayList<String>(11);
		for (int j = 0; j<tempStrArr.length; j++) {
			row.add(tempStrArr[j]);
		}
	
		table.add(row);
	}
	
        // Now extracting the Chicago high and low temperatures 
        rowsin = loadStrings("chicagotempnew.txt"); 
	rowsinno = rowsin.length;
	
        for (int i = 0; i < rowsinno; i++) { 
		String[] tempStrArr = rowsin[i].split(","); 
		ArrayList<String> row = new ArrayList<String>(11);
		//System.out.println(tempStrArr[0]);
		for (int j = 0; j<tempStrArr.length; j++) {
			row.add(tempStrArr[j]);

		}
		outside.add(row);
	}

        // Preparing three Integrator arrays of four different sizes to be used in interpolating the graphs of the different views
        
        Integrator[] interpolators = new Integrator[24];
        for(int i = 0; i<24; i++){
        interpolators[i] = new Integrator(32);
        interpolators[i].attraction = 0.2;
        }	
        interpolatorsList.add(interpolators);
        
        Integrator[] interpolators2 = new Integrator[31];
        for(int i = 0; i<31; i++){
        interpolators2[i] = new Integrator(32);
        interpolators2[i].attraction = 0.2;
        }	
        interpolatorsList.add(interpolators2);

        Integrator[] interpolators3 = new Integrator[12];
        for(int i = 0; i<12; i++){
        interpolators3[i] = new Integrator(32);
        interpolators3[i].attraction = 0.2;
        }	
        interpolatorsList.add(interpolators3);

         Integrator[] interpolators4 = new Integrator[31];
        for(int i = 0; i<31; i++){
        interpolators4[i] = new Integrator(32);
        interpolators4[i].attraction = 0.2;
        }	
        interpolatorsList.add(interpolators4);


}
//#############################################################################################################################################################################################
// Customizing the drop down lists including assigning colous and sizes
void customize(DropdownList ddl) {
	ddl.setBackgroundColor(color(72, 118, 255));
	ddl.setItemHeight(40);
	ddl.setBarHeight(35);
	ddl.captionLabel().style().marginTop = 3;
	ddl.captionLabel().style().marginLeft = 3;
	ddl.valueLabel().style().marginTop = 3;
	ddl.setColorBackground(color(39, 64, 139));
	ddl.setColorActive(color(72, 118, 255));
}
//#############################################################################################################################################################################################
/*
// This mehtod was supposed to be used to have easier use of the drop down lists, but due to size limit, it was commented out.
void keyPressed() {
	if (key=='1') {
		// set the height of a pulldown menu, should always be a multiple of itemHeight
		p1.setHeight(120);
	} 
	else if (key=='2') {
		// set the height of a pulldown menu, should always be a multiple of itemHeight
		p1.setHeight(240);
	}
	else if (key=='i') {
		// set the height of a pulldown menu item, should always be a fraction of the pulldown menu
		p1.setItemHeight(80);
	} 
	else if (key=='u') {
		// set the height of a pulldown menu item, should always be a fraction of the pulldown menu
		p1.setItemHeight(40);
		p1.setBackgroundColor(color(100, 0, 0));
	}
}
 */
//#############################################################################################################################################################################################
/*
// This method was used to only show the options available on choosing any of the items in the dropdown lists, but as it wasn't always working properly (not updating current choices)
// I preferred to comment it out and return to it if I had more time.
void controlEvent(ControlEvent theEvent) {
	// PulldownMenu is if type ControlGroup.
	// A controlEvent will be triggered from within the ControlGroup.
	// therefore you need to check the originator of the Event with
	// if (theEvent.isGroup())
	// to avoid an error message from controlP5.

	if (theEvent.isGroup()) {
		// check if the Event was triggered from a ControlGroup
		println(theEvent.group().value()+" from "+theEvent.group());
	} 
	else if (theEvent.isController()) {
		println(theEvent.controller().value()+" from "+theEvent.controller());
	}
	if (p1.stringValue().equals("August")||p1.stringValue().equals("September")||p1.stringValue().equals("October")||p1.stringValue().equals("November")||p1.stringValue().equals("December")) {

		if (years == 7) {
			p3.removeItem("2011");
			years --;
		}
	}
	else {
		if (years == 6) {
			years++;
			p3.addItem("2011", 7);
		}
	}
	if (p1.stringValue().equals("February"))
	{
		//System.out.println("###################\nFebruary chosen\n########");
		if (!p3.stringValue().equals("2008")) {
			p2.removeItem("29");
			days= 28;
		}
		else {
			if (days == 28)
				p2.addItem("29", 29);
			days = 29;
		}
		p2.removeItem("30");
		p2.removeItem("31");
	}
	else {
		if (p1.stringValue().equals("April")||p1.stringValue().equals("June")||p1.stringValue().equals("September")||p1.stringValue().equals("November"))
		{
			if (days==28) {
				p2.addItem("29", 29);
				p2.addItem("30", 30);
				days = 30;
			}
			else {
				if (days == 29) {
					p2.addItem("30", 30);
					days = 30;
				}
				else {
					if (days == 31) {
						p2.removeItem("31");
						days--;
					}
				}
			}
		}
		else {

			if (days == 29) {
				p2.addItem("30", 30);
				p2.addItem("31", 31);
			}
			if (days == 30)
				p2.addItem("31", 31);
			else {
				if (days == 28) {
					p2.addItem("29", 29);
					p2.addItem("30", 30);
					p2.addItem("31", 31);
				}
			}

			days = 31;
		}
	}
}
 */
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//#############################################################################################################################################################################################
// The main Draw method .... A lot of things going on here
void draw() {
	PFont font = loadFont("ArialMT-28.vlw");
	PFont fontBold = loadFont("Arial-BoldMT-36.vlw");
	textFont(font);
	background(230, 230, 250);
        
        //Showing the table button no matter what the view is
        
image(tableButton, 933, 521);

	if(view == 1 ){	
		image(labmap, 150, 50);
		textAlign(CENTER);
		rectMode(CORNER);

		// Displaying temperatures on the room spaces on the map
		textFont(fontBold);
		fill(128, 0, 0);
		text(t1, 543, 129);

		text(t2, 739, 182);

		text(t3, 751, 314);

		text(t4, 618, 304);

		text(t5, 491, 302);

		text(t6, 331, 290);

		text(t7, 330, 128);

		textFont(font);
		fill(0, 0, 139);
		textAlign(CENTER);
		String monthabr = monthSelected.substring(0, 3);
                textSize(20);
		String newDate = monthabr+"/"+daySelected+"/"+yearSelected;

		ArrayList<ArrayList<String>> result = findDate(newDate);
		String dayn = "";
		if(!result.isEmpty()){
			dayn = result.get(0).get(0);
		}else{
			alert = "No data available to view\n Shown on the map, the data from the last available date";

		}
		text(dayn+ " " + monthSelected+ " " + daySelected + " ,"+ yearSelected + " "+ timeSelected+ ampm, 450, 30);
		fill(0);

                // Showing the arrows if there are previous/next elements to avoid going out of the database
		if (!(daySelected == 31 && monthSelected.equals("July") && yearSelected == 2011 && timeSelected.equals("11:00") && ampm.equals("PM"))) {
			image(rightarrow, 960, 315);
		}
		if (!(daySelected == 1 && monthSelected.equals("August") && yearSelected == 2005 && timeSelected.equals("12:00")&&ampm.equals("AM"))) {
			image(leftarrow, 15, 320);
		}
		image(rightarrow, 810, 560);
		
                // Preparing rollover boxes to appear if the user points at any room
                
		if (dist(mouseX, mouseY, 327, 185)<60) {

			strokeWeight(30);
			fill(176, 196, 222);
			rect(50, 105, 200, 200);
			fill(0);
			textSize(18);
			textAlign(CENTER);
			int c = t7 - 32;
			c = c * 5/9;
			text("Office Space\nRoom # 7\n Temperature\n in Fahrenheits:\n" + t7+"\n In Celsius:\n" + c, 150, 125);
			alert = "";  
		}
		if (dist(mouseX, mouseY, 535, 185)<70) {
			strokeWeight(30);
			fill(176, 196, 222);
			rect(305, 105, 200, 200);
			fill(0);
			textSize(18);
			textAlign(CENTER);

			int c = t1 - 32;
			c = c * 5/9;
			text("Meeting Room\nRoom # 1\n Temperature\n in Fahrenheits:\n" + t1+"\n In Celsius:\n" + c, 400, 125);
			alert = "";  
		}
		if (dist(mouseX, mouseY, 740, 185)<80) {
			strokeWeight(30);
			fill(176, 196, 222);
			rect(800, 105, 200, 200);
			fill(0);
			textSize(18);
			textAlign(CENTER);

			int c = t2 - 32;
			c = c * 5/9;
			text("Main Lab\nRoom # 2\n Temperature\n in Fahrenheits:\n" + t2+"\n In Celsius:\n" + c, 870, 125);
			alert = "";  
		}
		if (dist(mouseX, mouseY, 748, 317)<80) {
			strokeWeight(30);
			fill(176, 196, 222);
			rect(800, 405, 200, 200);
			fill(0);
			textSize(18);
			textAlign(CENTER);

			int c = t3 - 32;
			c = c * 5/9;
			text("Machine Room\nRoom # 3\n Temperature\n in Fahrenheits:\n" + t3+"\n In Celsius:\n" + c, 890, 425);
			alert = "";  
		}
		if (dist(mouseX, mouseY, 593, 304)<40) {
			strokeWeight(30);
			fill(176, 196, 222);
			rect(800, 405, 200, 200);
			fill(0);
			textSize(18);
			textAlign(CENTER);

			int c = t4 - 32;
			c = c * 5/9;
			text("Lounge\nRoom # 4\n Temperature\n in Fahrenheits:\n" + t4+"\n In Celsius:\n" + c, 890, 425);
			alert = "";  
		}

		if (dist(mouseX, mouseY, 486, 304)<40) {
			strokeWeight(30);
			fill(176, 196, 222);
			rect(300, 205, 200, 200);
			fill(0);
			textSize(18);
			textAlign(CENTER);

			int c = t5 - 32;
			c = c * 5/9;
			text("Prototype Space\nRoom # 5\n Temperature\n in Fahrenheits:\n" + t5+"\n In Celsius:\n" + c, 390, 225);
			alert = "";
		}

		if (dist(mouseX, mouseY, 318, 300)<40) {
			strokeWeight(30);
			fill(176, 196, 222);
			rect(100, 205, 200, 200);
			fill(0);
			textSize(18);
			textAlign(CENTER);

			int c = t6 - 32;
			c = c * 5/9;
			text("Classroom\nRoom # 6\n Temperature\n in Fahrenheits:\n" + t6+"\n In Celsius:\n" + c, 190, 225);
			alert = "";
		}
		fill(0);
		textFont(font);
		textSize(22);
		text(alert,480, 500);
		textSize(28);

	}else{
		if(view == 2){
                    // Day View: Showing a graph of all the temperatures across the hours of the day. If for any reason, a temperature is missing at a certain time, the last correct temperature
                    // is shown instead to avoid non-continuous graphs
			fill(255);
			image(leftarrow, 10, 10);
			String monthabr = monthSelected.substring(0, 3);
			fill(0);
			fill(255);
			String newDate = monthabr+"/"+daySelected+"/"+yearSelected;

			ArrayList<ArrayList<String>> resulttimes = findDate(newDate);
			String dayn = "";
			if(resulttimes.isEmpty()){
				alert = "No data available to view";
				fill(0);
				textFont(font);
				textSize(22);
				text(alert,480, 350);
				textSize(24);
				text(monthSelected+ " " + daySelected + " ,"+ yearSelected + " ", 600,30);

			}
			else{
				dayn = resulttimes.get(0).get(0);
				rectMode(CORNERS);
				noStroke();
				rect(plotX1, plotY1, plotX2, plotY2);
				fill(0, 0, 139);
				textSize(20);
				text(dayn+ " " + monthSelected+ " " + daySelected + " ,"+ yearSelected + " ", 620,30);

				drawAxisLabels();
				drawTempLabels();
				drawXLabels();
				drawDayTemps(roomSelected);
				drawDataHighLight();
                              
                                //Updating the interpolars
                                Integrator[] interpolars = interpolatorsList.get(0);
                                for(int i= 0; i<24; i++){
                                interpolatorsList.get(0)[i].update();
                                }
				
                                textSize(16);
				fill(176,196,222);
				strokeWeight(2);
				rect(plotX1+5,plotY1+5,plotX1+55,plotY1+55);
				fill(0);
				textAlign(CENTER);
				textSize(20);
				text(roomSelected,plotX1+30, plotY1+35);
			}

                        // Again showing the right arrow at the right time ... This will be repeated for each view
			if (!(daySelected == 31 && monthSelected.equals("July") && yearSelected == 2011)) {
				image(rightarrow, 960, 315);
			}
			if (!(daySelected == 1 && monthSelected.equals("August") && yearSelected == 2005)) {
				image(leftarrow, 15, 320);
			}
			image(rightarrow, 810, 560);
			fill(176,196,222);		
			noStroke();
			rect(752,5,942,39);
			fill(0);
			textSize(20);

                        // For this view and for the Month and Year views, if only the room's graph is showing, offer the user to show the other rooms. If all are shown, ask the user if they
                        // want to hide it. 
                        
			if(showing){
				text("Hide Other Rooms", 845,25);
				for(int i = 1 ;i<8 ;i++){
					if(i != roomSelected){
						drawDayTemps(i);                }
				}
			}else{
				text("Show Other Rooms", 845,25);
			}

		}
		if(view == 3){
			
                        // Month View: Showing the average temperature of each day in the month
                        
                        fill(255);
			image(leftarrow, 10, 10);
			String monthabr = monthSelected.substring(0, 3);
			fill(0);
			fill(255);
			rectMode(CORNERS);
			noStroke();
			rect(plotX1, plotY1, plotX2, plotY2);
			fill(0, 0, 139);
			textSize(22);
			text(monthSelected+ " ,"+ yearSelected + " ", 620,30);

			ArrayList<ArrayList<ArrayList<String>>> results = getMonth(monthSelected);
			if(results.isEmpty()){
				alert = "No data available to view";
				fill(0);
				textFont(font);
				textSize(22);
				text(alert,480, 350);
				textSize(28);
				//text(monthSelected+ " " + yearSelected, 820,30);

			}else{
				drawAxisLabels();
				drawXLabels();
				drawTempLabels();

				drawMonthTemps(roomSelected);
				drawDataHighLight();
                                Integrator[] interpolars = interpolatorsList.get(1);
                                for(int i= 0; i<31; i++){
                                interpolars[i].update();
                                }
				
				textSize(16);
				fill(176,196,222);
				strokeWeight(2);
				rect(plotX1+5,plotY1+5,plotX1+55,plotY1+55);
				fill(0);
				textAlign(CENTER);
				textSize(20);
				text(roomSelected,plotX1+30, plotY1+35);
			}
			
                        if (!(monthSelected.equals("July") && yearSelected == 2011)) {
				image(rightarrow, 960, 315);
			}
			if (!(monthSelected.equals("August") && yearSelected == 2005)) {
				image(leftarrow, 15, 320);
			}
			
                        // This arrow is the one used in all views to update the current timings shown to be the ones on the drop down lists!
                        
                        image(rightarrow, 810, 560);
			fill(176,196,222);		
			noStroke();
			rect(752,5,942,39);
			fill(0);
			textSize(20);

			if(showing){
				text("Hide Other Rooms", 845,25);
				for(int i = 1 ;i<8 ;i++){
					if(i != roomSelected){
						drawMonthTemps(i);                }
				}
			}else{
				text("Show Other Rooms", 845,25);
			}

		}else{
			if(view == 4){
                                
                                // Year View: Showing the Average temperature of each month along the year
                                
				fill(255);
				
                                // This arrow in this view and the month, day, history and chicago views, returns the user to the very first view of the map
                                
                                image(leftarrow, 10, 10);
				fill(0);
				fill(255);
				rectMode(CORNERS);
				noStroke();
				rect(plotX1, plotY1, plotX2, plotY2);
				fill(0, 0, 139);
				textSize(26);
				text(yearSelected + " ", 630,25);

				drawAxisLabels();
				drawXLabels();
				drawTempLabels();

				noFill();
				drawYearTemps(roomSelected);
                                Integrator[] interpolars = interpolatorsList.get(2);
                                for(int i= 0; i<12; i++){
                                interpolars[i].update();
                                }
				
				textSize(16);

				fill(176,196,222);
				strokeWeight(2);
				rect(plotX1+5,plotY1+5,plotX1+55,plotY1+55);
				fill(0);
				textAlign(CENTER);
				textSize(20);
				text(roomSelected,plotX1+30, plotY1+35);
				if (yearSelected != 2011) {
					image(rightarrow, 960, 315);
				}
				if (yearSelected != 2005) {
					image(leftarrow, 15, 320);
				}
				image(rightarrow, 810, 560);
				
                                fill(176,196,222);		
				noStroke();
				rect(752,5,942,39);
				fill(0);
				textSize(20);
				textAlign(CENTER);
				if(showing){
					text("Hide Other Rooms", 845,25);
					noFill();
					for(int i = 1 ;i<8 ;i++){
						if(i != roomSelected){
							//System.out.println("Here! Here!");
							drawYearTemps(i);                }
					}
				}else{
					text("Show Other Rooms", 845,25);
				}


			}if(view == 5){
  
                                // History View: Compares current month to the same month in the different years
                                
				fill(255);
				image(leftarrow, 10, 10);
				fill(0);
				fill(255);
				rectMode(CORNERS);
				noStroke();
				rect(plotX1, plotY1, plotX2, plotY2);
				fill(0, 0, 139);
				textSize(24);
				text(monthSelected + ", "+ yearSelected, 630,25);
				drawAxisLabels();
				drawXLabels();
				drawTempLabels();
				compareMonths();
				noFill();
				textSize(16);
                                Integrator[] interpolars = interpolatorsList.get(3);
                                for(int i= 0; i<31; i++){
                                interpolars[i].update();
                                }
				
				fill(176,196,222);
				strokeWeight(2);
				rect(plotX1+5,plotY1+5,plotX1+55,plotY1+55);
				fill(0);
				textAlign(CENTER);
				textSize(20);
				text(roomSelected,plotX1+30, plotY1+35);

				image(rightarrow, 810, 560);


			}

		}
		if(view == 6){
                       
                        // Chicago View: Compares the current month's average room temperatures to the outside Chicago high and low temperatures 
                        // Suitable for viewing the season's changes 
                        
			fill(255);
			image(leftarrow, 10, 10);
			fill(0);
			fill(255);
			rectMode(CORNERS);
			noStroke();
			rect(plotX1, plotY1, plotX2, plotY2);
			fill(0, 0, 139);
			textSize(24);
			text(monthSelected + ", "+ yearSelected, 630,25);
			drawAxisLabels();
			drawXLabels();
			drawTempLabels();
			drawMonthTemps(roomSelected);
			Integrator[] interpolars = interpolatorsList.get(1);
                                for(int i= 0; i<31; i++){
                                interpolars[i].update();
                                }
				
                        findMonthChicago();
			drawDataHighLight();

			noFill();
			textSize(16);

			fill(176,196,222);
			strokeWeight(2);
			rect(plotX1+5,plotY1+5,plotX1+55,plotY1+55);
			fill(0);
			textAlign(CENTER);
			textSize(20);
			text(roomSelected,plotX1+30, plotY1+35);
			if (!(monthSelected.equals("July") && yearSelected == 2011)) {
				image(rightarrow, 960, 315);
			}
			if (!(monthSelected.equals("August") && yearSelected == 2005)) {
				image(leftarrow, 15, 320);
			}
			image(rightarrow, 810, 560);



		}
                
		drawViewTabs();
		textAlign(CENTER);                   

	}
drawLegend();

// If in one of the following views, the zoom button can be shown. The zoom button allows the user to toggle whether or not they can click on a certain point in the graph to zoom
// If zooming is allowed and the user clicks on the graph, one of the following occurs:
// If the user is in the day view, they can view the map at the clicked hour
// If in month/History or Chicago view, then they can view the graph of the day clicked
// If in year view, they can view the chosen month's graph

if(view == 2 || view == 3 || view == 4 || view == 5 || view == 6){
image(zoomButton, 933, 601);

}
if(dist(mouseX,mouseY,965,546)<50){
drawTable();
}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// findDate method searches for the input date in table and returns all the entries of all times with that date saved in an ArrayList of Arraylist of Strings
public ArrayList<ArrayList<String>> findDate(String date) {

	ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();
	boolean done = false;
	for (int i = 0; i<table.size() && !done; i++) {
		ArrayList<String> entry = table.get(i);
		if(entry.size()>1)
			if (entry.get(1).equals(date)) {
				results.add(entry);
				if (i < table.size()-1) {
					if (!entry.get(1).equals(table.get(i+1).get(1))) {
						done = true;
					}
				}
			}
	}
	return results;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// findTime method searched for a certain time withing a given arraylist of different times of a certain day (Arraylist of Arraylist of Strings)and returns the required time of that day
public ArrayList<String> findTime(ArrayList<ArrayList<String>> entries) {

	boolean found = false;
	ArrayList<String> result = new ArrayList<String>();
	String[] timeSecsCurrent = timeSelected.split(":");

	String minstr2 = timeSecsCurrent[1];
	String hrstr2 = timeSecsCurrent[0];
	int mins2 = Integer.parseInt(minstr2);
	int hrs2 = Integer.parseInt(hrstr2);
	for (int i = 0; i<entries.size() && !found;i++) {
		ArrayList<String> entry = entries.get(i);
		if(entry.size()>1){
			String[] timeSecs = entry.get(2).split(":");

			String minstr = timeSecs[1];
			String hrstr = timeSecs[0];
			int mins = Integer.parseInt(minstr);
			int hrs = Integer.parseInt(hrstr);
			if (hrs == hrs2 && mins == mins2){

				if (entry.get(3).equals(ampm)){
					found = true;
					result = entry;
				}
			}
		}
	}
	if(!found){
		for (int i = 0; i<entries.size() && !found;i++) {
			ArrayList<String> entry = entries.get(i);
			if (entry.get(2).substring(0,2).equals(timeSelected.substring(0,2))){
				if (entry.get(3).equals(ampm)){
					found = true;
					result = entry;
				}
			}

		}}
	return result;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void mousePressed() {
  
        // Toggling the hide other graphs and the view other graphs views
	if(dist(mouseX,mouseY,800, 20)<70 &&(view == 2 || view == 3 || view == 4)){
		
		showing = !showing;
	}

        // Toggling the ability to zoom on clicking on and off
        if(dist(mouseX,mouseY,933, 601)<50 &&(view == 2 || view == 3 || view == 4 || view == 5 || view == 6)){
		zoom = !zoom;
	}

        // Changing the view, if zoom is enabled and the user clicks on the graph
        if(zoom && (mouseX >= plotX1) && (mouseX <= plotX2-5) && (mouseY < plotY2) && (mouseY > plotY1)){
        if(view == 2){
         float r = map(mouseX, plotX1, plotX2-5, 0, 23);
         int x = ceil(r);
         switch(x){
         case 0: timeSelected = "12:00"; ampm = "AM";break;
         case 1: timeSelected = "1:00"; ampm = "AM";break;
         case 2: timeSelected = "2:00"; ampm = "AM";break;
         case 3: timeSelected = "3:00"; ampm = "AM";break;
         case 4: timeSelected = "4:00"; ampm = "AM";break;
         case 5: timeSelected = "5:00"; ampm = "AM";break;
         case 6: timeSelected = "6:00"; ampm = "AM";break;
         case 7: timeSelected = "7:00"; ampm = "AM";break;
         case 8: timeSelected = "8:00"; ampm = "AM";break;
         case 9: timeSelected = "9:00"; ampm = "AM";break;
         case 10: timeSelected = "10:00"; ampm = "AM";break;
         case 11: timeSelected = "11:00"; ampm = "AM";break;
         case 12: timeSelected = "12:00"; ampm = "PM";break;
         case 13: timeSelected = "1:00"; ampm = "PM";break;
         case 14: timeSelected = "2:00"; ampm = "PM";break;
         case 15: timeSelected = "3:00"; ampm = "PM";break;
         case 16: timeSelected = "4:00"; ampm = "PM";break;
         case 17: timeSelected = "5:00"; ampm = "PM";break;
         case 18: timeSelected = "6:00"; ampm = "PM";break;
         case 19: timeSelected = "7:00"; ampm = "PM";break;
         case 20: timeSelected = "8:00"; ampm = "PM";break;
         case 21: timeSelected = "9:00"; ampm = "PM";break;
         case 22: timeSelected = "10:00"; ampm = "PM";break;
         case 23: timeSelected = "11:00"; ampm = "PM";break;
         }
         view = 1;
        }
        if(view == 3 || view == 5){
         int dayCount = 0;
         String monthabr = monthSelected.substring(0,3);
			if(monthabr.equals("Feb")){
				if(yearSelected == 2008)
					dayCount = 29;
				else
					dayCount = 28;
			}else{
				if(monthabr.equals("Jan")||monthabr.equals("Mar")||monthabr.equals("May")||monthabr.equals("Jul")||monthabr.equals("Aug")||monthabr.equals("Oct")||monthabr.equals("Dec"))
					dayCount = 31;
				else
					dayCount = 30;
			}
			
         float r = map(mouseX, plotX1, plotX2-5, 1, dayCount);
        int x1 = ceil(r);
        int x2 = floor(r);
        int x ;
        float app = map(r,x2,x1,0,1);
        if(app > 0.5)
        x = x1;
        else
        x = x2;
         daySelected = x;
         view = 2;
        }
        
        if(view == 4){
        float r = map(mouseX, plotX1, plotX2-5, 1, 12);
        int x1 = ceil(r);
        int x2 = floor(r);
        int x ;
        float app = map(r,x2,x1,0,1);
        if(app > 0.5)
        x = x1;
        else
        x = x2;
        switch(x){
        case 1: monthSelected = "January";break;
      case 2: monthSelected = "February";break;
    case 3: monthSelected = "March";break;
  case 4: monthSelected = "April";break;
case 5: monthSelected = "May";break;
case 6: monthSelected = "June";break;
case 7: monthSelected = "July";break;
case 8: monthSelected = "August";break;
case 9: monthSelected = "September";break;
case 10: monthSelected = "October";break;
case 11: monthSelected = "November";break;
case 12: monthSelected = "December";break;

      }
      view = 3;
        }
        }

        // Changing the view if a tab is clicked  
	if(mouseY > tabTop && mouseY <tabBottom){
		for(int i = 0; i< 5; i++){
			if(mouseX > tabLeft[i] && mouseX < tabRight[i]){
				view = i + 2;
			}
		}
	}

        // Going back to the map view if the back arrow is clicked	
	if (dist(mouseX, mouseY, 32, 33)< 25 && view != 1) {
		view = 1;
		background(255);
	}	

        // According to the view, the next arrow functions(next day, next hour, next month or next year)
	if (dist(mouseX, mouseY, 980, 345)< 25) {
		if(view == 1 && !(daySelected == 31 && monthSelected.equals("July") && yearSelected == 2011 && timeSelected.equals("11:00") && ampm.equals("PM"))){
			alert = "";
			if (timeSelected.equals("12:00")) {
				timeSelected = "1:00";
			}
			else {
				if (timeSelected.equals("1:00")) {
					timeSelected = "2:00";
				}
				else {
					if (timeSelected.equals("2:00")) {
						timeSelected = "3:00";
					}
					else {
						if (timeSelected.equals("3:00")) {
							timeSelected = "4:00";
						}
						else {
							if (timeSelected.equals("4:00")) {
								timeSelected = "5:00";
							}
							else {
								if (timeSelected.equals("5:00")) {
									timeSelected = "6:00";
								}
								else {
									if (timeSelected.equals("6:00")) {
										timeSelected = "7:00";
									}
									else {
										if (timeSelected.equals("7:00")) {
											timeSelected = "8:00";
										}
										else {
											if (timeSelected.equals("8:00")) {

												timeSelected = "9:00";
											}
											else {
												if (timeSelected.equals("9:00")) {
													timeSelected = "10:00";
												}
												else {
													if (timeSelected.equals("10:00")) {
														timeSelected = "11:00";
													}
													else {
														timeSelected = "12:00";
														if (ampm.equals("PM")) {
															ampm = "AM";
															switch(daySelected) {
															case 28: 
																if (monthSelected.equals("February")) {
																	if (yearSelected == 2008)daySelected++; 
																	else {
																		daySelected = 1;
																		monthSelected = "March";
																	}
																}
																else {
																	daySelected++;
																}
																break;
															case 29: 
																if (monthSelected.equals("February")) {
																	daySelected = 1;
																	monthSelected = "March";
																}
																else {
																	daySelected++;
																}
																break;
															case 30: 
																if (monthSelected.equals("April")||monthSelected.equals("June")||monthSelected.equals("September")||monthSelected.equals("November")) {
																	daySelected = 1; 
																	if (monthSelected.equals("April"))monthSelected = "May";
																	else {
																		if (monthSelected.equals("June"))monthSelected = "July";
																		else {
																			if (monthSelected.equals("September"))monthSelected = "October";
																			else {
																				monthSelected = "December";
																			}
																		}
																	}
																}

																else {
																	daySelected = 31;
																}
																break;
															case 31:
																daySelected = 1;
																if (monthSelected.equals("January"))monthSelected = "February";
																else {
																	if (monthSelected.equals("March"))monthSelected = "April";
																	else {
																		if (monthSelected.equals("May"))monthSelected = "June";
																		else {
																			if (monthSelected.equals("July"))monthSelected = "August";
																			else {if(monthSelected.equals("August"))
																				monthSelected = "September";
																			else{
																				if (monthSelected.equals("October"))
																					monthSelected = "November";
																				else {
																					yearSelected++;
																					monthSelected = "January";
																				}
																			}
																			}
																		}
																	}
																}
																break;
															default: 
																daySelected++;
																break;
															}
														}
														else{
															ampm = "PM";
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		else{
			if(view == 2){
				if(!(daySelected == 31 && monthSelected.equals("July") && yearSelected == 2011)){
					switch(daySelected) {
					case 28: 
						if (monthSelected.equals("February")) {
							if (yearSelected == 2008)daySelected++; 
							else {
								daySelected = 1;
								monthSelected = "March";
							}
						}
						else {
							daySelected++;
						}
						break;
					case 29: 
						if (monthSelected.equals("February")) {
							daySelected = 1;
							monthSelected = "March";
						}
						else {
							daySelected++;
						}
						break;
					case 30: 
						if (monthSelected.equals("April")||monthSelected.equals("June")||monthSelected.equals("September")||monthSelected.equals("November")) {
							daySelected = 1; 
							if (monthSelected.equals("April"))monthSelected = "May";
							else {
								if (monthSelected.equals("June"))monthSelected = "July";
								else {
									if (monthSelected.equals("September"))monthSelected = "October";
									else {
										monthSelected = "December";
									}
								}
							}
						}

						else {
							daySelected = 31;
						}
						break;
					case 31:
						daySelected = 1;
						if (monthSelected.equals("January"))monthSelected = "February";
						else {
							if (monthSelected.equals("March"))monthSelected = "April";
							else {
								if (monthSelected.equals("May"))monthSelected = "June";
								else {
									if (monthSelected.equals("July"))monthSelected = "August";
									else {if(monthSelected.equals("August"))
										monthSelected = "September";
									else{
										if (monthSelected.equals("October"))
											monthSelected = "November";
										else {
											yearSelected++;
											monthSelected = "January";
										}
									}
									}
								}
							}
						}
						break;
					default: 
						daySelected++;
						break;
					}
				}
			}else{

				if(view == 3 || view == 6){
					if(!(monthSelected.equals("July") && yearSelected == 2011)){

						if(monthSelected.equals("January")){
							monthSelected = "February";
						}
						else{
							if(monthSelected.equals("February")){
								monthSelected = "March";
							}
							else{
								if(monthSelected.equals("March")){
									monthSelected = "April";
								}
								else{
									if(monthSelected.equals("April")){
										monthSelected = "May";
									}
									else{
										if(monthSelected.equals("May")){
											monthSelected = "June";
										}
										else{
											if(monthSelected.equals("June")){
												monthSelected = "July";
											}
											else{
												if(monthSelected.equals("July")){
													monthSelected = "August";
												}
												else{
													if(monthSelected.equals("August")){
														monthSelected = "September";
													}
													else{

														if(monthSelected.equals("September")){
															monthSelected = "October";
														}
														else{
															if(monthSelected.equals("October")){
																monthSelected = "November";
															}
															else{
																if(monthSelected.equals("November")){
																	monthSelected = "December";
																}
																else{
																	monthSelected = "January";
																	yearSelected++;
																}
															}

														}}
												}
											}
										}
									}
								}
							}
						}
					}
				}
				else{

					if(view == 4){
						if(yearSelected != 2011)
							yearSelected++;
					}
				}

			}
		}
	}
            // According to the view, the previous arrow functions(previous day, previous hour, previous month or previous year)
	
	if (dist(mouseX, mouseY, 42, 344)< 25) {
		if(view == 1 && !(daySelected == 1 && monthSelected.equals("August") && yearSelected == 2005 && timeSelected.equals("12:00")&&ampm.equals("AM"))){		
			alert = "";
			if (timeSelected.equals("1:00")) {
				timeSelected = "12:00";
			}
			else {
				if (timeSelected.equals("2:00")) {
					timeSelected = "1:00";
				}
				else {
					if (timeSelected.equals("3:00")) {
						timeSelected = "2:00";
					}
					else {
						if (timeSelected.equals("4:00")) {
							timeSelected = "3:00";
						}
						else {
							if (timeSelected.equals("5:00")) {
								timeSelected = "4:00";
							}
							else {
								if (timeSelected.equals("6:00")) {
									timeSelected = "5:00";

								}
								else {
									if (timeSelected.equals("7:00")) {
										timeSelected = "6:00";
									}
									else {
										if (timeSelected.equals("8:00")) {
											timeSelected = "7:00";
										}
										else {
											if (timeSelected.equals("9:00")) {

												timeSelected = "8:00";
											}
											else {
												if (timeSelected.equals("10:00")) {
													timeSelected = "9:00";
												}
												else {
													if (timeSelected.equals("11:00")) {
														timeSelected = "10:00";
													}
													else {
														if(timeSelected.equals("12:00")){
															timeSelected = "11:00";
															if (ampm.equals("AM")) {
																ampm = "PM";
																switch(daySelected) {
																case 1: 
																	if (monthSelected.equals("March")) {
																		monthSelected = "February";
																		if (yearSelected == 2008)daySelected=29; 
																		else {
																			daySelected = 28;
																		}
																	}
																	else {
																		if (monthSelected.equals("May")||monthSelected.equals("July")||monthSelected.equals("October")||monthSelected.equals("December")) {
																			daySelected = 30; 
																			if (monthSelected.equals("May"))monthSelected = "April";
																			else {
																				if (monthSelected.equals("July"))monthSelected = "June";
																				else {
																					if (monthSelected.equals("October"))monthSelected = "September";
																					else {
																						monthSelected = "November";
																					}
																				}
																			}
																		}else{
																			daySelected = 31;
																			if (monthSelected.equals("February"))monthSelected = "January";
																			else {
																				if (monthSelected.equals("April"))monthSelected = "March";
																				else {
																					if (monthSelected.equals("June"))monthSelected = "May";
																					else {
																						if (monthSelected.equals("August"))monthSelected = "July";
																						else {
																							if (monthSelected.equals("November"))
																								monthSelected = "October";
																							else{
																								if(monthSelected.equals("September"))
																									monthSelected = "August";
																								else {
																									yearSelected--;
																									monthSelected = "December";
																								}
																							}
																						}
																					}
																				}
																			}


																		}

																	}

																	break;
																default: 
																	daySelected--;
																}
															}
															else{
																//System.out.println("Why are you here?");
																ampm = "AM";
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			if(!updateTemperatures())
;
//Updating temperatures shown on the map if current time or date is changed
		}else{

			if(view == 2){
				if(!(daySelected == 1 && monthSelected.equals("August") && yearSelected == 2005)){
					switch(daySelected) {
					case 1: 
						if (monthSelected.equals("March")) {
							monthSelected = "February";
							if (yearSelected == 2008)daySelected=29; 
							else {
								daySelected = 28;
							}
						}
						else {
							if (monthSelected.equals("May")||monthSelected.equals("July")||monthSelected.equals("October")||monthSelected.equals("December")) {
								daySelected = 30; 
								if (monthSelected.equals("May"))monthSelected = "April";
								else {
									if (monthSelected.equals("July"))monthSelected = "June";
									else {
										if (monthSelected.equals("October"))monthSelected = "September";
										else {
											monthSelected = "November";
										}
									}
								}
							}else{
								daySelected = 31;
								if (monthSelected.equals("February"))monthSelected = "January";
								else {
									if (monthSelected.equals("April"))monthSelected = "March";
									else {
										if (monthSelected.equals("June"))monthSelected = "May";
										else {
											if (monthSelected.equals("August"))monthSelected = "July";
											else {
												if (monthSelected.equals("November"))
													monthSelected = "October";
												else{
													if(monthSelected.equals("September"))
														monthSelected = "August";
													else {
														yearSelected--;
														monthSelected = "December";
													}
												}
											}
										}
									}
								}


							}

						}

						break;
					default: 
						daySelected--;
					}
				}
			}
			else{
				if(view == 3  || view == 6){
					if(!(monthSelected.equals("August") && yearSelected == 2005)){

						if(monthSelected.equals("March")){
							monthSelected = "February";
						}
						else{
							if(monthSelected.equals("April")){
								monthSelected = "March";
							}
							else{
								if(monthSelected.equals("May")){
									monthSelected = "April";
								}
								else{
									if(monthSelected.equals("June")){
										monthSelected = "May";
									}
									else{
										if(monthSelected.equals("July")){
											monthSelected = "June";
										}
										else{
											if(monthSelected.equals("August")){
												monthSelected = "July";
											}
											else{
												if(monthSelected.equals("September")){
													monthSelected = "August";
												}
												else{
													if(monthSelected.equals("October")){
														monthSelected = "September";
													}
													else{

														if(monthSelected.equals("November")){
															monthSelected = "October";
														}
														else{
															if(monthSelected.equals("December")){
																monthSelected = "November";
															}
															else{
																if(monthSelected.equals("February")){
																	monthSelected = "January";
																}
																else{
																	monthSelected = "December";
																	yearSelected--;
																}
															}

														}}
												}
											}
										}
									}
								}
							}
						}
					}          }
				else{

					if(view == 4){
						if(yearSelected != 2005)
							yearSelected--;
					}
				}
			}
		}
	}
	
          // Changing the chosen date accroding to the user's choices on the drop down lists
          
          if (dist(mouseX, mouseY, 838, 585)< 25) {
		alert = "";
		if(p1.stringValue().equalsIgnoreCase("Choose A Month")||p2.stringValue().equals("Choose a Day")||p3.stringValue().equals("Choose a Year")){
			alert = "Please choose a month, day and a year or you can use next and previous arrows to browse";
		}else{
			if((p1.stringValue().equals("February")&&(p2.stringValue().equals("31")))||(p1.stringValue().equals("February")&&(p2.stringValue().equals("30")))){
				alert = "February has 28/29 days";}
			else{
				if((p1.stringValue().equals("February")&&(p2.stringValue().equals("29"))&&(!p3.stringValue().equals("2008")))){

					alert = "February that year had only 28 days";}
				else{
					if(p2.stringValue().equals("31")&&(p1.stringValue().equals("September")||p1.stringValue().equals("April")||p1.stringValue().equals("June")||p1.stringValue().equals("November"))){
						alert = "This month is only 30 days"; 
					}
					else{
						monthSelected = p1.stringValue();
						daySelected = Integer.parseInt(p2.stringValue());
						yearSelected = Integer.parseInt(p3.stringValue());
						updateTemperatures();
					}

				}
			}
		}

	}
	
          //If the user clicks on any room, that should take them to the day view of that room
        if(dist(mouseX,mouseY, 540, 133)<50){
		view = 2;
		roomSelected = 1;	
	}
	if(dist(mouseX,mouseY, 340, 136)<50){
		view = 2;
		roomSelected  = 7;	
	}
	if(dist(mouseX,mouseY, 739,182)<50){
		view = 2;
		roomSelected  = 2;	
	}
	if(dist(mouseX,mouseY, 751, 314)<50){
		view = 2;
		roomSelected  = 3;	
	}
	if(dist(mouseX,mouseY, 608, 305)<25){
		view = 2;
		roomSelected  = 4;	
	}
	if(dist(mouseX,mouseY, 491, 302)<50){
		view = 2;
		roomSelected  = 5;	
	}
	if(dist(mouseX,mouseY, 330, 290)<50){
		view = 2;
		roomSelected  = 6;	
	}


}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
boolean updateTemperatures() {
  // This method updates the current temperatures according to newly chosen date and time
	boolean updated = false;
	String monthabr = monthSelected.substring(0, 3);
	String newDate = monthabr+"/"+daySelected+"/"+yearSelected;
	ArrayList<ArrayList<String>> resulttimes = findDate(newDate);
	ArrayList<String> result = findTime(resulttimes);
	if(result.isEmpty()){
		if(daySelected<10)
			newDate = monthabr+"/0"+daySelected+"/"+yearSelected;
		resulttimes = findDate(newDate);
		result = findTime(resulttimes);

	}
	if(result.size()>1){
  		if(!result.get(4).equals("-333")){

			t1 = Integer.parseInt(result.get(4));
			updated = true;
		}
		else{
			String ampm2 = ampm;

			String hrstr,minstr,hrstr2,minstr2;
			int mins,hr;

			if(timeSelected.length()==4){

				hrstr = timeSelected.substring(0,1);
				minstr = timeSelected.substring(2);

				hrstr2 = timeSelected.substring(0,1);
				minstr2 = timeSelected.substring(2);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);

			}else{

				hrstr = timeSelected.substring(0,2);
				minstr = timeSelected.substring(3);

				hrstr2 = timeSelected.substring(0,2);
				minstr2 = timeSelected.substring(3);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);



			}




			boolean found = false;
			while(!found){
				if(mins == 60){
					minstr = "00";
					hr++;
					if(hr == 13){
						hrstr ="1";
						if(ampm.equals("AM"))
							ampm = "PM";
						else{
							ampm = "AM";							
							found = true;
						}
					}
				}else{
					mins++;
					if(mins<10)
						minstr="0";
					else
						minstr = "";

					minstr = minstr+ mins;
				}
				timeSelected = hrstr+":"+minstr;


				ArrayList<String> resulttemp = findTime(resulttimes);

				//resulttemp = findTime(resulttimes);
				if(!resulttemp.isEmpty())
					if(!resulttemp.get(4).equals("-333")){
						found = true;
						t1 = Integer.parseInt(resulttemp.get(4));
						updated = true;

					}

			}


			ampm = ampm2;
			hrstr = hrstr2;
			minstr = minstr2;
			timeSelected = hrstr+":"+minstr;

		}
	}
	if(result.size()>1){
		if(!result.get(5).equals("-333")){

			t2 = Integer.parseInt(result.get(5));
			//System.out.println(t2);
		}else{

			String hrstr,minstr,hrstr2,minstr2;
			int mins,hr;
			String ampm2 = ampm;

			if(timeSelected.length()==4){
				hrstr = timeSelected.substring(0,1);
				minstr = timeSelected.substring(2);

				hrstr2 = timeSelected.substring(0,1);
				minstr2 = timeSelected.substring(2);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);
			}else{

				hrstr = timeSelected.substring(0,2);
				minstr = timeSelected.substring(3);

				hrstr2 = timeSelected.substring(0,2);
				minstr2 = timeSelected.substring(3);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);



			}



			boolean found = false;
			while(!found){
				if(mins == 60){
					minstr = "00";
					hr++;
					if(hr == 13){
						hrstr ="1";
						if(ampm.equals("AM"))
							ampm = "PM";
						else{
							ampm = "AM";							
							found = true;
						}
					}
				}else{
					mins++;
					if(mins<10)
						minstr="0";
					else
						minstr = "";minstr = minstr+ mins;
				}

				timeSelected = hrstr+":"+minstr;

				ArrayList<String> resulttemp = findTime(resulttimes);
				//resulttemp = findTime(resulttimes);
				if(!resulttemp.isEmpty())
					if(!resulttemp.get(5).equals("-333")){
						found = true;
						t2= Integer.parseInt(resulttemp.get(5));

					}

			}

			hrstr = hrstr2;
			minstr = minstr2;
			timeSelected = hrstr+":"+minstr;
			ampm = ampm2;

		}

	}
	if(result.size()>1){
		if(!result.get(6).equals("-333"))
			t3 = Integer.parseInt(result.get(6));
		else{


			String ampm2 = ampm;
			String hrstr,minstr,hrstr2,minstr2;
			int mins,hr;
			if(timeSelected.length()==4){
				hrstr = timeSelected.substring(0,1);
				minstr = timeSelected.substring(2);

				hrstr2 = timeSelected.substring(0,1);
				minstr2 = timeSelected.substring(2);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);
			}else{

				hrstr = timeSelected.substring(0,2);
				minstr = timeSelected.substring(3);

				hrstr2 = timeSelected.substring(0,2);
				minstr2 = timeSelected.substring(3);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);



			}



			boolean found = false;
			while(!found){
				if(mins == 60){
					minstr = "00";
					hr++;
					if(hr == 13){
						hrstr ="1";
						if(ampm.equals("AM"))
							ampm = "PM";
						else{
							ampm = "AM";	
							found = true;
						}
					}
				}else{
					mins++;
					if(mins<10)
						minstr="0";
					else
						minstr = "";minstr = minstr+ mins;
				}

				timeSelected = hrstr+":"+minstr;


				ArrayList<String> resulttemp = findTime(resulttimes);

				//resulttemp = findTime(resulttimes);
				if(!resulttemp.isEmpty())

					if(!resulttemp.get(6).equals("-333")){
						found = true;
						t3 = Integer.parseInt(resulttemp.get(6));

					}

			}
			ampm = ampm2;
			hrstr = hrstr2;
			minstr = minstr2;
			timeSelected = hrstr+":"+minstr;


		}

	} if(result.size()>1){
		if(!result.get(7).equals("-333"))
			t4 = Integer.parseInt(result.get(7));
		else{

			String ampm2 = ampm;
			String hrstr,minstr,hrstr2,minstr2;
			int mins,hr;
			if(timeSelected.length()==4){
				hrstr = timeSelected.substring(0,1);
				minstr = timeSelected.substring(2);

				hrstr2 = timeSelected.substring(0,1);
				minstr2 = timeSelected.substring(2);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);
			}else{

				hrstr = timeSelected.substring(0,2);
				minstr = timeSelected.substring(3);

				hrstr2 = timeSelected.substring(0,2);
				minstr2 = timeSelected.substring(3);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);



			}



			boolean found = false;
			while(!found){
				if(mins == 60){
					minstr = "00";
					hr++;
					if(hr == 13){
						hrstr ="1";
						if(ampm.equals("AM"))
							ampm = "PM";
						else{
							found = true;
							ampm = "AM";
						}
					}
				}else{
					mins++;
					if(mins<10)
						minstr="0";
					else
						minstr = "";
					minstr = minstr+ mins;
				}


				timeSelected = hrstr+":"+minstr;

				ArrayList<String> resulttemp = findTime(resulttimes);

				//resulttemp = findTime(resulttimes);
				if(!resulttemp.isEmpty())
					if(!resulttemp.get(7).equals("-333")){
						found = true;
						t4 = Integer.parseInt(resulttemp.get(7));

					}

			}

			hrstr = hrstr2;
			minstr = minstr2;
			timeSelected = hrstr+":"+minstr;
			ampm = ampm2;

		}
	}
	if(result.size()>1){
		if(!result.get(8).equals("-333"))
			t5 = Integer.parseInt(result.get(8));
		else{

			String ampm2 = ampm;
			String hrstr,minstr,hrstr2,minstr2;
			int mins,hr;
			if(timeSelected.length()==4){
				hrstr = timeSelected.substring(0,1);
				minstr = timeSelected.substring(2);

				hrstr2 = timeSelected.substring(0,1);
				minstr2 = timeSelected.substring(2);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);
			}else{

				hrstr = timeSelected.substring(0,2);
				minstr = timeSelected.substring(3);

				hrstr2 = timeSelected.substring(0,2);
				minstr2 = timeSelected.substring(3);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);



			}



			boolean found = false;
			while(!found){
				if(mins == 60){
					minstr = "00";
					hr++;
					if(hr == 13){
						hrstr ="01";
						if(ampm.equals("AM"))
							ampm = "PM";
						else{
							found = true;
						}
					}
				}else{
					mins++;
					if(mins<10)
						minstr="0";
					else
						minstr = "";minstr = minstr+ mins;
				}

				timeSelected = hrstr+":"+minstr;

				ArrayList<String> resulttemp = findTime(resulttimes);

				//resulttemp = findTime(resulttimes);
				if(!resulttemp.isEmpty())
					if(!resulttemp.get(8).equals("-333")){
						found = true;
						t5 = Integer.parseInt(resulttemp.get(8));

					}

			}
			ampm = ampm2;
			hrstr = hrstr2;
			minstr = minstr2;
			timeSelected = hrstr+":"+minstr;


		}
	}
	if(result.size()>1){
		if(!result.get(9).equals("-333"))
			t6 = Integer.parseInt(result.get(9));
		else{

			String ampm2 = ampm;
			String hrstr,minstr,hrstr2,minstr2;
			int mins,hr;
			if(timeSelected.length()==4){
				hrstr = timeSelected.substring(0,1);
				minstr = timeSelected.substring(2);

				hrstr2 = timeSelected.substring(0,1);
				minstr2 = timeSelected.substring(2);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);
			}else{

				hrstr = timeSelected.substring(0,2);
				minstr = timeSelected.substring(3);

				hrstr2 = timeSelected.substring(0,2);
				minstr2 = timeSelected.substring(3);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);



			}


			boolean found = false;
			while(!found){
				if(mins == 60){
					minstr = "00";
					hr++;
					if(hr == 13){
						hrstr ="01";
						if(ampm.equals("AM"))
							ampm = "PM";
						else{
							found = true;
						}
					}
				}else{
					mins++;
					if(mins<10)
						minstr="0";
					else
						minstr = "";minstr = minstr+ mins;
				}

				timeSelected = hrstr+":"+minstr;

				ArrayList<String> resulttemp = findTime(resulttimes);

				//resulttemp = findTime(resulttimes);
				if(!resulttemp.isEmpty())
					if(!resulttemp.get(9).equals("-333")){
						found = true;
						t6 = Integer.parseInt(resulttemp.get(9));

					}

			}

			hrstr = hrstr2;
			minstr = minstr2;
			timeSelected = hrstr+":"+minstr;
			ampm = ampm2;

		}
	}
	if(result.size()>1){
		if(!result.get(10).equals("-333")){
			t7 = Integer.parseInt(result.get(10));
			//System.out.println("T7 = " + t7);
		}else{

			String ampm2 = ampm;
			String hrstr,minstr,hrstr2,minstr2;
			int mins,hr;
			if(timeSelected.length()==4){
				hrstr = timeSelected.substring(0,1);
				minstr = timeSelected.substring(2);

				hrstr2 = timeSelected.substring(0,1);
				minstr2 = timeSelected.substring(2);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);
			}else{

				hrstr = timeSelected.substring(0,2);
				minstr = timeSelected.substring(3);

				hrstr2 = timeSelected.substring(0,2);
				minstr2 = timeSelected.substring(3);

				mins = Integer.parseInt(minstr);
				hr = Integer.parseInt(hrstr);



			}



			boolean found = false;
			while(!found){
				if(mins == 60){
					minstr = "00";
					hr++;
					if(hr == 13){
						hrstr ="1";
						if(ampm.equals("AM"))
							ampm = "PM";
						else{
							found = true;
						}
					}
				}else{
					mins++;
					if(mins<10)
						minstr="0";
					else
						minstr = "";minstr = minstr+ mins;
				}

				timeSelected = hrstr+":"+minstr;

				ArrayList<String> resulttemp = findTime(resulttimes);

				//resulttemp = findTime(resulttimes);
				if(!resulttemp.isEmpty())
					if(!resulttemp.get(10).equals("-333")){
						found = true;
						t7 = Integer.parseInt(resulttemp.get(10));

					}

			}
			ampm = ampm2;
			hrstr = hrstr2;
			minstr = minstr2;
			timeSelected = hrstr+":"+minstr;


		}
	}
	return updated;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This is the method that draws the day view graphs, by getting all the temperatures of that date and drawing the graph for the room
// If the room passed is the selected room(to be in main focus), its graph is highlighted(thicker)

void drawDayTemps(int room){
  if(room==roomSelected){
  minHere = 70;
  maxHere = 70;
  }
	if(view == 2){
		if(room == 1)
			stroke(0);
		else{
			if(room == 2)
				stroke(#ff0000);
			else{
				if(room == 3)
					stroke(#7FFF00);
				else{
					if(room == 4)
						stroke(#FF83FA);

					else{
						if(room == 5)
							stroke(#00BFFF);
						else{
							if(room == 6)
								stroke(#9B30FF);
							else{
								stroke(#008B00);
							}

						}

					}

				}

			}

		}
Integrator []interpolators = interpolatorsList.get(0);
		String monthabr = monthSelected.substring(0, 3);

		String newDate = monthabr+"/"+daySelected+"/"+yearSelected;

		ArrayList<ArrayList<String>> result = findDate(newDate);
		int hr = 12;
		String amorpm = "AM";
		int lasttemp = 0;
		if(result.isEmpty()){
		}else{
			int count = 0;

			beginShape();
			int i = 0;
			while(i<result.size()&&count <24){
				boolean done = false;
				int nexthr = 0;
				if(i<result.size()-1){
					String[] time = result.get(i+1).get(2).split(":");
					nexthr = Integer.parseInt(time[0]);  
				}

				ArrayList<String> entry = result.get(i);
				if(entry.size() <11)
;
				else{


					String currenthr =""; 
					if(entry.get(2).length()>4)
						currenthr = entry.get(2).substring(0,2);
					else
						currenthr = ""+ entry.get(2).charAt(0);
					//		System.out.println("Currenthr = "+ currenthr + " VS hour = " + hr);  		
					if(Integer.parseInt(currenthr) == hr && amorpm.equals(entry.get(3))){
						i++;
						if(room == 1){
							noFill();
							if(room== roomSelected)
								strokeWeight(6);
							else
								strokeWeight(2);
							if(Integer.parseInt(entry.get(4))!= -333){
  				                             	lasttemp = Integer.parseInt(entry.get(4));
  // The following piece of code will be repeated in all the cases of all drawing mehtod with minor changes to update the interpolators used for smooth transitions
  
float y;
if(room == roomSelected){
      interpolators[count].target(lasttemp);
       if(minHere>lasttemp)
       minHere = lasttemp;
       else
       if(maxHere<lasttemp)
       maxHere = lasttemp;		
                                											
y = map(interpolators[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
}
								float x = map(count,0,23,plotX1,plotX2-5);
								done = true;
								count ++;
								vertex(x,y);
                             			}
						}else{
							if(room == 2){
								noFill();
								if(room== roomSelected)
									strokeWeight(6);
								else
									strokeWeight(2);
								if(Integer.parseInt(entry.get(5))!= -333){
									
                                                                        lasttemp = Integer.parseInt(entry.get(5));
                                                                        float y;
if(room == roomSelected){
      interpolators[count].target(lasttemp);
if(minHere>lasttemp)
       minHere = lasttemp;
       else
       if(maxHere<lasttemp)
       maxHere = lasttemp;				
                                											
y = map(interpolators[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
}
float x = map(count,0,23,plotX1,plotX2-5);
									vertex(x,y);
                                                                        count++;done = true;

								}
							}  
							else{
								if(room == 3){
									noFill();
									if(room== roomSelected)
										strokeWeight(6);
									else
										strokeWeight(2);
									if(Integer.parseInt(entry.get(6))!= -333){
										lasttemp = Integer.parseInt(entry.get(6));
      float y;
if(room == roomSelected){
      interpolators[count].target(lasttemp);
	if(minHere>lasttemp)
       minHere = lasttemp;
       else
       if(maxHere<lasttemp)
       maxHere = lasttemp;			
                                											
y = map(interpolators[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
}
									float x = map(count,0,23,plotX1,plotX2-5);
										vertex(x,y);
										count++;done = true;


									}
								}
								else{
									if(room == 4){
										noFill();
										if(room== roomSelected)
											strokeWeight(6);
										else
											strokeWeight(2);
										if(Integer.parseInt(entry.get(7))!= -333){ lasttemp = Integer.parseInt(entry.get(7));
float y;
if(room == roomSelected){
      interpolators[count].target(lasttemp);
	if(minHere>lasttemp)
       minHere = lasttemp;
       else
       if(maxHere<lasttemp)
       maxHere = lasttemp;			
                                											
y = map(interpolators[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
}
										float x = map(count,0,23,plotX1,plotX2-5);
										vertex(x,y);
										count++;done = true;
										}
									}
									else{
										if(room == 5){
											noFill();
											if(room== roomSelected)
												strokeWeight(6);
											else
												strokeWeight(2);
											if(Integer.parseInt(entry.get(8))!=-333){ 
												lasttemp = Integer.parseInt(entry.get(8));
float y;
if(room == roomSelected){
      interpolators[count].target(lasttemp);
	if(minHere>lasttemp)
       minHere = lasttemp;
       else
       if(maxHere<lasttemp)
       maxHere = lasttemp;			
                                											
y = map(interpolators[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
}
										float x = map(count,0,23,plotX1,plotX2-5);
												vertex(x,y);
												count++;done = true;
											}
										}
										else{
											if(room == 6){
												noFill();
												if(room== roomSelected)
													strokeWeight(6);
												else
													strokeWeight(2);
												if(Integer.parseInt(entry.get(9))!=-333){
													lasttemp = Integer.parseInt(entry.get(9));
float y;
if(room == roomSelected){
      interpolators[count].target(lasttemp);
	if(minHere>lasttemp)
       minHere = lasttemp;
       else
       if(maxHere<lasttemp)
       maxHere = lasttemp;			
                                											
y = map(interpolators[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
}
										float x = map(count,0,23,plotX1,plotX2-5);
													vertex(x,y);
													count++;done = true;
												}
											}
											else{
												if(room == 7){
													noFill();
													if(room== roomSelected)
														strokeWeight(6);
													else
														strokeWeight(2);
													if(Integer.parseInt(entry.get(10))!=-333){
														lasttemp = Integer.parseInt(entry.get(10));
float y;
if(room == roomSelected){
      interpolators[count].target(lasttemp);
	if(minHere>lasttemp)
       minHere = lasttemp;
       else
       if(maxHere<lasttemp)
       maxHere = lasttemp;			
                                											
y = map(interpolators[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
}
										float x = map(count,0,23,plotX1,plotX2-5);
														vertex(x,y);
														count++;done = true;
													}
												}
												else{
;
												}
											}
										}
									}
								}
							}
						}


						if(done){
							switch (hr){
							case 12: hr = 1;break;
							case 1: hr = 2; break;
							case 2: hr = 3; break;
							case 3: hr = 4; break;
							case 4: hr = 5; break;
							case 5: hr = 6; break;
							case 6: hr = 7; break;
							case 7: hr = 8; break;
							case 8: hr = 9;break;
							case 9: hr = 10; break;
							case 10: hr = 11;break;
							case 11:hr = 12;if(amorpm.equals("AM"))amorpm = "PM"; else amorpm = "PM"; break;
							}
						}else{
							if(nexthr == 0){
							}
							if(nexthr!=Integer.parseInt(currenthr) && nexthr != 0){
								noFill();
								if(room== roomSelected)
									strokeWeight(6);
								else
									strokeWeight(2);
								if(lasttemp != 0){
float y;
if(room == roomSelected){
      interpolators[count].target(lasttemp);
			if(minHere>lasttemp)
       minHere = lasttemp;
       else
       if(maxHere<lasttemp)
       maxHere = lasttemp;	
                                											
y = map(interpolators[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
}
										float x = map(count,0,23,plotX1,plotX2-5);
									vertex(x,y);

								}
								count++;
								switch (hr){
								case 12: hr = 1;break;
								case 1: hr = 2; break;
								case 2: hr = 3; break;
								case 3: hr = 4; break;
								case 4: hr = 5; break;
								case 5: hr = 6; break;
								case 6: hr = 7; break;
								case 7: hr = 8; break;
								case 8: hr = 9;break;
								case 9: hr = 10; break;
								case 10: hr = 11;break;
								case 11:hr = 12;if(amorpm.equals("AM"))amorpm = "PM"; else amorpm = "PM"; break;
								}

							}
						}
					}

					else{
						if((Integer.parseInt(currenthr) > hr &&  ((entry.get(3).equals("PM") && amorpm.equals("AM"))||entry.get(3).equals(amorpm)) && !currenthr.equals("12"))||(Integer.parseInt(currenthr) < hr && entry.get(3).equals("PM") && amorpm.equals("AM"))
								||(Integer.parseInt(currenthr) == hr && !amorpm.equals(entry.get(3)))||(currenthr.equals("12")&&entry.get(3).equals("PM"))||(entry.get(3).equals("PM")&& hr == 12 && amorpm.equals("PM"))){
							switch (hr){
							case 12: hr = 1;break;
							case 1: hr = 2; break;
							case 2: hr = 3; break;
							case 3: hr = 4; break;
							case 4: hr = 5; break;
							case 5: hr = 6; break;
							case 6: hr = 7; break;
							case 7: hr = 8; break;
							case 8: hr = 9;break;
							case 9: hr = 10; break;
							case 10: hr = 11;break;
							case 11:hr = 12;if(amorpm.equals("AM"))amorpm = "PM"; else amorpm = "PM"; break;
							}
							noFill();
							if(room== roomSelected)
								strokeWeight(6);
							else
								strokeWeight(2);
							if(lasttemp != 0){
float y;
if(room == roomSelected){
      interpolators[count].target(lasttemp);
	if(minHere>lasttemp)
       minHere = lasttemp;
       else
       if(maxHere<lasttemp)
       maxHere = lasttemp;			
                                											
y = map(interpolators[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
}
										float x = map(count,0,23,plotX1,plotX2-5);
								vertex(x,y);

							}
							count++;					
						}else{

							i++;}
					}
				}
			}

			endShape();


		}
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This method titles the axes of the graphs according to which view the user is using.
void drawAxisLabels(){
	fill(0);
	textSize(18);
	textLeading(18);
	textAlign(CENTER);
	text("Temperatures\nin\nFahrenheit",labelX + 10,(plotY1+plotY2)/2);
	textAlign(CENTER, CENTER);

	if(view == 2){
		text("Hour",(plotX1+plotX2)/2 , labelY);

	}else{
		if(view == 3 || view == 5 || view == 6){
			text("Day",(plotX1+plotX2)/2 , labelY);

		}else{
			if(view == 4)
				text("Month",(plotX1+plotX2)/2 , labelY);


		}
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The following method draws the X-axis labels according to which view the user is in.
void drawXLabels(){
	if(view == 2){
		fill(0);
		textSize(12);
		textAlign(CENTER, TOP);
		// Use thin, gray lines to draw the grid.
		stroke(224);
		strokeWeight(1);
		int hr = 12;
		String amorpm = "AM";
		for(int i = 0; i<24; i++){
			String time = ""+hr+ ":00";
			float x = map(i, 0, 23,plotX1,plotX2-5);
			text(time+"\n"+amorpm,x,plotY2+5);
			line(x, plotY1, x,plotY2);

			switch (hr){
			case 12: hr = 1;break;
			case 1: hr = 2; break;
			case 2: hr = 3; break;
			case 3: hr = 4; break;
			case 4: hr = 5; break;
			case 5: hr = 6; break;
			case 6: hr = 7; break;
			case 7: hr = 8; break;
			case 8: hr = 9;break;
			case 9: hr = 10; break;
			case 10: hr = 11;break;
			case 11:hr = 12; amorpm="PM";break;
			}
		}
	}else{

		if(view == 3 || view == 5 || view == 6){
			textSize(12);
			String monthabr = monthSelected.substring(0, 3);

			int dayCount = 0;
			if(monthabr.equals("Feb")){
				if(yearSelected == 2008)
					dayCount = 29;
				else
					dayCount = 28;
			}else{
				if(monthabr.equals("Jan")||monthabr.equals("Mar")||monthabr.equals("May")||monthabr.equals("Jul")||monthabr.equals("Aug")||monthabr.equals("Oct")||monthabr.equals("Dec"))
					dayCount = 31;
				else
					dayCount = 30;
			}
			fill(0);
			textAlign(CENTER, TOP);
			// Use thin, gray lines to draw the grid.
			stroke(224);
			strokeWeight(1);
			int lastday = 0;
			for(int i = 0; i<dayCount;i++){
				float x = map(i, 0,dayCount-1,plotX1,plotX2-5);
				text(i+1,x,plotY2+5);
				line(x, plotY1, x,plotY2);

			}



		}else{

			if(view == 4){
				String startMonth = "Jan";
				for(int i = 0; i<12; i++){
					fill(0);
					textSize(12);
					textAlign(CENTER, TOP);
					// Use thin, gray lines to draw the grid.
					stroke(224);
					strokeWeight(1);
					float x = map(i, 0,11,plotX1,plotX2-5);
					//System.out.println(entry);	
					//if((Integer.parseInt(entry)-lastday) == 1){
					text(startMonth,x,plotY2+5);
					line(x, plotY1, x,plotY2);

					if(startMonth.equals("Jan")){
						startMonth = "Feb";
					}
					else{
						if(startMonth.equals("Feb")){
							startMonth = "Mar";
						}
						else{
							if(startMonth.equals("Mar")){
								startMonth = "Apr";
							}
							else{
								if(startMonth.equals("Apr")){
									startMonth = "May";
								}
								else{
									if(startMonth.equals("May")){
										startMonth = "Jun";
									}
									else{
										if(startMonth.equals("Jun")){
											startMonth = "Jul";
										}
										else{
											if(startMonth.equals("Jul")){
												startMonth = "Aug";
											}
											else{
												if(startMonth.equals("Aug")){
													startMonth = "Sep";
												}
												else{

													if(startMonth.equals("Sep")){
														startMonth = "Oct";
													}
													else{
														if(startMonth.equals("Oct")){
															startMonth = "Nov";
														}
														else{
															if(startMonth.equals("Nov")){
																startMonth = "Dec";
															}
														}

													}}
											}
										}
									}
								}
							}
						}
					}}
			}
		}
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// According to which view, the temperature labels on the Y-axis are chosen. In most of the views, the temperature range is from 32 to 92, which were the minimum
// and the maximum in the data. If in the chicago view, however, a larger scale is needed to plot the chicago outside high and low temperatures from (-7 to 100) fahrenheits

void drawTempLabels(){
	if(view != 6){
		fill(0);
		textSize(12);
		textAlign(RIGHT, CENTER);
		for(int i = 92; i>=32;i--){
			float y = map(i,mintemp,maxtemp,plotY2,plotY1);
			if(i%5==0)
				text(i,plotX1-10,y);
		}
	}
	else{
		fill(0);
		textSize(12);
		textAlign(RIGHT, CENTER);
		for(int i = 100; i>=-7;i--){
			float y = map(i,-7,100,plotY2,plotY1);
			if(i%5 == 0)
				text(i,plotX1-10,y);
		}

	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This methos is the one that allows the user to point over a certain point in the graph(in month and day views) and get a detailed text of the temperature in fahrenheit and Celsius.
void drawDataHighLight(){
	if(view == 2){
		if(roomSelected == 1)
			stroke(0);
		else{
			if(roomSelected == 2)
				stroke(#ff0000);
			else{
				if(roomSelected == 3)
					stroke(#7FFF00);
				else{
					if(roomSelected == 4)
						stroke(#FF83FA);

					else{
						if(roomSelected == 5)
							stroke(#00BFFF);
						else{
							if(roomSelected == 6)
								stroke(#9B30FF);
							else{
								stroke(#008B00);
							}

						}

					}

				}

			}

		}
		strokeWeight(12);
		String monthabr = monthSelected.substring(0, 3);

		String newDate = monthabr+"/"+daySelected+"/"+yearSelected;

		ArrayList<ArrayList<String>> result = findDate(newDate);
		int hr = 12;
		String amorpm = "AM";
		int lasttemp = 0;
		if(result.isEmpty()){
;
		}else{
			int count = 0;
			int i = 0;
			while(i<result.size()&&count <24){
				boolean done = false;
				int nexthr = 0;
				if(i<result.size()-1){
					String[] time = result.get(i+1).get(2).split(":");
					nexthr = Integer.parseInt(time[0]);  
				}

				ArrayList<String> entry = result.get(i);
				if(entry.size() <11)
;
				else{


					String currenthr =""; 
					if(entry.get(2).length()>4)
						currenthr = entry.get(2).substring(0,2);
					else
						currenthr = ""+ entry.get(2).charAt(0);
					if(Integer.parseInt(currenthr) == hr && amorpm.equals(entry.get(3))){
						i++;
						if(roomSelected != 0)
							if(Integer.parseInt(entry.get(roomSelected+3))!= -333){
								lasttemp = Integer.parseInt(entry.get(roomSelected+3));
								float y = map(lasttemp,mintemp,maxtemp,plotY2,plotY1);
								float x = map(count,0,23,plotX1,plotX2-5);
								done = true;

								int c = lasttemp - 32;
								c = c * 5/9;
								if(dist(mouseX, mouseY, x, y)<7){
									point(x,y);
									fill(0);
									textSize(14);
									textAlign(CENTER);
									text("On\n" +entry.get(0) +"\n"+  newDate + " "+ entry.get(2)+ entry.get(3)+ ",\ntemperature = "+ lasttemp + " °F = " + c + " °C",x+ 25,y+25);
								}
								count ++;

								if(done){
									switch (hr){
									case 12: hr = 1;break;
									case 1: hr = 2; break;
									case 2: hr = 3; break;
									case 3: hr = 4; break;
									case 4: hr = 5; break;
									case 5: hr = 6; break;
									case 6: hr = 7; break;
									case 7: hr = 8; break;
									case 8: hr = 9;break;
									case 9: hr = 10; break;
									case 10: hr = 11;break;
									case 11:hr = 12;if(amorpm.equals("AM"))amorpm = "PM"; else amorpm = "PM"; break;
									}
								}else{
									if(nexthr == 0){
									}
									if(nexthr!=Integer.parseInt(currenthr) && nexthr != 0){
									}
									count++;
									switch (hr){
									case 12: hr = 1;break;
									case 1: hr = 2; break;
									case 2: hr = 3; break;
									case 3: hr = 4; break;
									case 4: hr = 5; break;
									case 5: hr = 6; break;
									case 6: hr = 7; break;
									case 7: hr = 8; break;
									case 8: hr = 9;break;
									case 9: hr = 10; break;
									case 10: hr = 11;break;
									case 11:hr = 12;if(amorpm.equals("AM"))amorpm = "PM"; else amorpm = "PM"; break;
									}

								}
							}
					}

					else{
						if((Integer.parseInt(currenthr) > hr &&  ((entry.get(3).equals("PM") && amorpm.equals("AM"))||entry.get(3).equals(amorpm)) && !currenthr.equals("12"))||(Integer.parseInt(currenthr) < hr && entry.get(3).equals("PM") && amorpm.equals("AM"))
								||(Integer.parseInt(currenthr) == hr && !amorpm.equals(entry.get(3)))||(currenthr.equals("12")&&entry.get(3).equals("PM"))||(entry.get(3).equals("PM")&& hr == 12 && amorpm.equals("PM"))){
							switch (hr){
							case 12: hr = 1;break;
							case 1: hr = 2; break;
							case 2: hr = 3; break;
							case 3: hr = 4; break;
							case 4: hr = 5; break;
							case 5: hr = 6; break;
							case 6: hr = 7; break;
							case 7: hr = 8; break;
							case 8: hr = 9;break;
							case 9: hr = 10; break;
							case 10: hr = 11;break;
							case 11:hr = 12;if(amorpm.equals("AM"))amorpm = "PM"; else amorpm = "PM"; break;
							}

							count++;					
						}
						else{

							i++;}
					}
				}
			}



		}
		strokeWeight(2);
	}
	else{
		if(view == 3){
			if(roomSelected == 1)
				stroke(0);
			else{
				if(roomSelected == 2)
					stroke(#ff0000);
				else{
					if(roomSelected == 3)
						stroke(#7FFF00);
					else{
						if(roomSelected == 4)
							stroke(#FF83FA);

						else{
							if(roomSelected == 5)
								stroke(#00BFFF);
							else{
								if(roomSelected == 6)
									stroke(#9B30FF);
								else{
									stroke(#008B00);
								}

							}

						}

					}

				}

			}
			String monthabr = monthSelected.substring(0, 3);
			String newDate = ""; 
			int dayCount = 0;
			if(monthabr.equals("Feb")){
				if(yearSelected == 2008)
					dayCount = 29;
				else
					dayCount = 28;
			}else{
				if(monthabr.equals("Jan")||monthabr.equals("Mar")||monthabr.equals("May")||monthabr.equals("Jul")||monthabr.equals("Aug")||monthabr.equals("Oct")||monthabr.equals("Dec"))
					dayCount = 31;
				else
					dayCount = 30;
			}
			ArrayList<ArrayList<ArrayList<String>>> results = getMonth(monthSelected);
			if(results.isEmpty()){
				alert = "No data available to view";
				fill(0);
				//textFont(font);
				textSize(22);
				text(alert,480, 350);
				textSize(28);
				text(monthSelected+ " " + yearSelected, 820,30);

			}else{
				int count = 0;
				int i = 0;
				while(i<results.size() && count <32){        
					String entry = results.get(i).get(0).get(1);
					if(entry.length()== 11)
						entry = entry.substring(4,6);
					else
						entry = ""+entry.charAt(4);
					if(Integer.parseInt(entry)- count == 1){
						int value = getDayAvg(results.get(i),roomSelected);

						noFill();
						strokeWeight(12);
						float y = map(value,mintemp,maxtemp,plotY2,plotY1);
						float x = map(count,0,dayCount-1,plotX1,plotX2-5); 
						int c = value - 32;
						c = c * 5/9;
						if(dist(mouseX, mouseY, x, y)<7){
							point(x,y);
							fill(0);
							textSize(14);
							textAlign(CENTER);
							text("On"+ results.get(i).get(0).get(0)+"\n"+results.get(i).get(0).get(1)+ ",\nthe average temperature =\n"+ value + " °F\n" + c + " °C",x+ 25,y+20);
						}

						count++;
						i++;
					}else{
						count++;		
					}
				}

			}
		}
		else{
			if(view == 6){
				if(roomSelected == 1)
					stroke(0);
				else{
					if(roomSelected == 2)
						stroke(#ff0000);
					else{
						if(roomSelected == 3)
							stroke(#7FFF00);
						else{
							if(roomSelected == 4)
								stroke(#FF83FA);

							else{
								if(roomSelected == 5)
									stroke(#00BFFF);
								else{
									if(roomSelected == 6)
										stroke(#9B30FF);
									else{
										stroke(#008B00);
									}

								}

							}

						}

					}

				}
				String monthabr = monthSelected.substring(0, 3);
				String newDate = ""; 
				int dayCount = 0;
				if(monthabr.equals("Feb")){
					if(yearSelected == 2008)
						dayCount = 29;
					else
						dayCount = 28;
				}else{
					if(monthabr.equals("Jan")||monthabr.equals("Mar")||monthabr.equals("May")||monthabr.equals("Jul")||monthabr.equals("Aug")||monthabr.equals("Oct")||monthabr.equals("Dec"))
						dayCount = 31;
					else
						dayCount = 30;
				}
				ArrayList<ArrayList<ArrayList<String>>> results = getMonth(monthSelected);
				if(results.isEmpty()){
					alert = "No data available to view";
					fill(0);
					textSize(22);
					text(alert,480, 350);
					textSize(28);
					text(monthSelected+ " " + yearSelected, 820,30);

				}else{
					int count = 0;
					int i = 0;
					while(i<results.size() && count <32){        
						String entry = results.get(i).get(0).get(1);
						if(entry.length()== 11)
							entry = entry.substring(4,6);
						else
							entry = ""+entry.charAt(4);
						if(Integer.parseInt(entry)- count == 1){
							int value = getDayAvg(results.get(i),roomSelected);

							noFill();
							strokeWeight(12);
							float y = map(value,-7,100,plotY2,plotY1);
							float x = map(count,0,dayCount-1,plotX1,plotX2-5); 
							int c = value - 32;
							c = c * 5/9;
							if(dist(mouseX, mouseY, x, y)<7){
								point(x,y);
								fill(0);
								textSize(14);
								textAlign(CENTER);
								text("On"+ results.get(i).get(0).get(0)+"\n"+results.get(i).get(0).get(1)+ ",\nthe average temperature =\n"+ value + " °F\n" + c + " °C",x+ 25,y+20);
							}

							count++;
							i++;
						}else{
							count++;		
						}
					}

				}
			}			
		}
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// There are some shortcut keys that can be pressed in this visualization.
// If in any of the graph views, pressing any key from 1 through 7 changed the currently selected room
// Clicking 'a' takes the user to the view of the tab on the left of the current selected tab while 's' takes them to the right
// Clicking 'h' in day, month or year view hides/shows the other rooms' graphs

void keyPressed(){


	switch(key){
	case '1': roomSelected = 1;break;
	case '2': roomSelected = 2;break;
	case '3': roomSelected = 3;break;
	case '4': roomSelected = 4;break;
	case '5': roomSelected = 5;break;
	case '6': roomSelected = 6;break;
	case '7': roomSelected = 7;break;
	case 'A': case'a': if(view == 2)view = 6; else view--;break;
	case 'S': case's': if(view == 6)view = 2; else view++; break;
	case 'H': case 'h':showing = !showing;

	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Drawing the tabs to be used for the different views
void drawViewTabs(){
	rectMode(CORNERS);
	noStroke();
	textSize(20);
	textAlign(LEFT);

	if(tabLeft == null){
		tabLeft = new float[5];
		tabRight = new float[5];
	}

	float runningX = plotX1;
	tabTop = plotY1 - textAscent()-15;
	tabBottom = plotY1;

	for(int i = 2; i < 7; i++){
		String title = "";
		switch(i){
		case 2: title = "Day";break;
		case 3: title = "Month"; break;
		case 4: title = "Year";break;
		case 5: title = "History";break;
		case 6: title = "Chicago";break;
		}
		tabLeft[i-2] = runningX;
		float titleWidth = textWidth(title);
		tabRight[i-2] = tabLeft[i-2] + tabPad + titleWidth+ tabPad;

		fill(i == view ? 255: #B0C4DE);
		rect(tabLeft[i-2], tabTop, tabRight[i-2], tabBottom);

		fill(i == view ? 0: 255);
		text(title, runningX + tabPad, plotY1 - 10);

		runningX = tabRight[i-2];
	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//This method goes through the table and acquires all of the available data in the chosen mnth

ArrayList<ArrayList<ArrayList<String>>> getMonth(String mnth){
	ArrayList<ArrayList<ArrayList<String>>> results = new ArrayList<ArrayList<ArrayList<String>>>();

	String monthabr = mnth.substring(0, 3);
	int dayCount = 0;
	if(monthabr.equals("Feb")){
		if(yearSelected == 2008)
			dayCount = 29;
		else
			dayCount = 28;
	}else{
		if((monthabr.equals("Jan"))||(monthabr.equals("Mar"))||(monthabr.equals("May"))||(monthabr.equals("Jul"))||(monthabr.equals("Aug"))||(monthabr.equals("Oct"))||(monthabr.equals("Dec")))
			dayCount = 31;
		else{
			if((monthabr.equals("Apr"))||(monthabr.equals("Jun"))||(monthabr.equals("Sep"))||(monthabr.equals("Nov")))
				dayCount = 30;
			else
;
		}

	}

	for(int i = 1; i<=dayCount;i++){
		String newDate = monthabr+"/"+i+"/"+yearSelected;
		ArrayList<ArrayList<String>> result = findDate(newDate);
		if(!result.isEmpty())
			results.add(result);		
		else{
			if(i<10){
				newDate = monthabr+"/0"+i+"/"+yearSelected;
				result = findDate(newDate);
				if(!result.isEmpty())
					results.add(result);		

			}
		}
		//	return results;
	}
	return results;

}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//getDayAvg Method taking in an ArrayList of ArrayList of Strings of table entries and a room number and getting the average temperature across the day for that room
int getDayAvg(ArrayList<ArrayList<String>> daytemps, int room){
	int avg = 0;
	int cnt = 0;
	for(int i = 0 ; i< daytemps.size();i++){
		ArrayList<String> entry = daytemps.get(i);

		if(!entry.get(room+3).equals("-333")){
			cnt++;
			avg+=Integer.parseInt(entry.get(room+3));
		}
	}
	avg = avg/cnt;

	return avg;

}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Similar to draw Day temperatures, the draw month temperatures draws the average temperatrues of each day in the chosen month. If the room passes is the currently focused on room, the
// graph is thicker fro easier recognition
void drawMonthTemps(int room){
  if(room == roomSelected){
  minHere = 70;
  maxHere = 70;
  }
	if(view == 3){
		if(room == 1)
			stroke(0);
		else{
			if(room == 2)
				stroke(#ff0000);
			else{
				if(room == 3)
					stroke(#7FFF00);
				else{
					if(room == 4)
						stroke(#FF83FA);

					else{
						if(room == 5)
							stroke(#00BFFF);
						else{
							if(room == 6)
								stroke(#9B30FF);
							else{
								stroke(#008B00);
							}

						}

					}

				}

			}

		}
Integrator[] interpolator = interpolatorsList.get(1);
		String monthabr = monthSelected.substring(0, 3);

		int dayCount = 0;
		if(monthabr.equals("Feb")){
			if(yearSelected == 2008)
				dayCount = 29;
			else
				dayCount = 28;
		}else{
			if(monthabr.equals("Jan")||monthabr.equals("Mar")||monthabr.equals("May")||monthabr.equals("Jul")||monthabr.equals("Aug")||monthabr.equals("Oct")||monthabr.equals("Dec"))
				dayCount = 31;
			else
				dayCount = 30;
		}
		ArrayList<ArrayList<ArrayList<String>>> results = getMonth(monthSelected);
		if(results.isEmpty()){
			alert = "No data available to view";
			fill(0);
			//textFont(font);
			textSize(22);
			text(alert,480, 350);
			textSize(28);
			text(monthSelected+ " " + yearSelected, 820,30);

		}else{
			beginShape();
			int count = 0;
			int i = 0;
			while(i<results.size() && count <32){        
				String entry = results.get(i).get(0).get(1);
				if(entry.length()== 11)
					entry = entry.substring(4,6);
				else
					entry = ""+entry.charAt(4);
				if(Integer.parseInt(entry)- count == 1){
					int value = getDayAvg(results.get(i),room);
					noFill();
					if(room == roomSelected)
						strokeWeight(6);
					else
						strokeWeight(2);
					float y;
if(room == roomSelected){
      interpolator[count].target(value);
	if(minHere>value)
       minHere = value;
       else
       if(maxHere<value)
       maxHere = value;			
                                											
y = map(interpolator[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(value,mintemp,maxtemp,plotY2,plotY1);
}
float x = map(count,0,dayCount-1,plotX1,plotX2-5); 
			vertex(x,y);
					count++;
					i++;
				}else{
					count++;		
				}
			}
			endShape();
		}
	}
	if(view == 6){
Integrator[] interpolator = interpolatorsList.get(1);

  		if(room == 1)
			stroke(0);
		else{
			if(room == 2)
				stroke(#ff0000);
			else{
				if(room == 3)
					stroke(#7FFF00);
				else{
					if(room == 4)
						stroke(#FF83FA);

					else{
						if(room == 5)
							stroke(#00BFFF);
						else{
							if(room == 6)
								stroke(#9B30FF);
							else{
								stroke(#008B00);
							}

						}

					}

				}

			}

		}
		String monthabr = monthSelected.substring(0, 3);

		int dayCount = 0;
		if(monthabr.equals("Feb")){
			if(yearSelected == 2008)
				dayCount = 29;
			else
				dayCount = 28;
		}else{
			if(monthabr.equals("Jan")||monthabr.equals("Mar")||monthabr.equals("May")||monthabr.equals("Jul")||monthabr.equals("Aug")||monthabr.equals("Oct")||monthabr.equals("Dec"))
				dayCount = 31;
			else
				dayCount = 30;
		}
		ArrayList<ArrayList<ArrayList<String>>> results = getMonth(monthSelected);
		if(results.isEmpty()){
			alert = "No data available to view";
			fill(0);
			//textFont(font);
			textSize(22);
			text(alert,480, 350);
			textSize(28);
			text(monthSelected+ " " + yearSelected, 820,30);

		}else{
			//                      int lastday = 0;
			beginShape();
			int count = 0;
			int i = 0;
			while(i<results.size() && count <32){        
				String entry = results.get(i).get(0).get(1);
				if(entry.length()== 11)
					entry = entry.substring(4,6);
				else
					entry = ""+entry.charAt(4);
				if(Integer.parseInt(entry)- count == 1){
					int value = getDayAvg(results.get(i),room);
			
					noFill();
					if(room == roomSelected)
						strokeWeight(6);
					else
						strokeWeight(2);
					float y;
if(room == roomSelected){
      interpolator[count].target(value);
	if(minHere>value)
       minHere = value;
       else
       if(maxHere<value)
       maxHere = value;			
                                											
y = map(interpolator[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(value,-7,100,plotY2,plotY1);
}
float x = map(count,0,dayCount-1,plotX1,plotX2-5); 

					vertex(x,y);
					count++;
					i++;
				}else{
					count++;		
				}
			}
			endShape();
		}

	}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Similar to the get month method, it acquires all the year's data to be then used for getting the average temperatures of each month and visualizing them
ArrayList<ArrayList<String>> getYear(int room){
	ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();
	String startMonth = "";
	int months = 0	;
	if(yearSelected == 2005){
		startMonth = "Aug";
		months = 5;
	}else{
		if(yearSelected == 2011){
			startMonth = "Jan";
			months =7; 
		}else{
			startMonth = "Jan";
			months = 12;
		}

	}
	for(int i = 0; i<months; i++){
		ArrayList<ArrayList<ArrayList<String>>> monthResult = getMonth(startMonth);
		ArrayList<String> oneMonth = new ArrayList<String>();
		if(monthResult.isEmpty()){
;
		}else{
			oneMonth.add(monthResult.get(0).get(i).get(1).substring(0,3));

			for(int j = 0;j<monthResult.size();j++){
				ArrayList<ArrayList<String>> entry = monthResult.get(j);
				if(!entry.isEmpty()){
					for(int k = 0; k<entry.size();k++){
						ArrayList<String> a = entry.get(k);
						if(a.size()==11)
						{
							String t = a.get(room+3);
							if(!t.equals("-333"))
								oneMonth.add(t);
						}
					}

				}
			}
			results.add(oneMonth);
			if(startMonth.equals("Jan")){
				startMonth = "Feb";
			}
			else{
				if(startMonth.equals("Feb")){
					startMonth = "Mar";
				}
				else{
					if(startMonth.equals("Mar")){
						startMonth = "Apr";
					}
					else{
						if(startMonth.equals("Apr")){
							startMonth = "May";
						}
						else{
							if(startMonth.equals("May")){
								startMonth = "Jun";
							}
							else{
								if(startMonth.equals("Jun")){
									startMonth = "Jul";
								}
								else{
									if(startMonth.equals("Jul")){
										startMonth = "Aug";
									}
									else{
										if(startMonth.equals("Aug")){
											startMonth = "Sep";
										}
										else{

											if(startMonth.equals("Sep")){
												startMonth = "Oct";
											}
											else{
												if(startMonth.equals("Oct")){
													startMonth = "Nov";
												}
												else{
													if(startMonth.equals("Nov")){
														startMonth = "Dec";
													}
												}

											}}
									}
								}
							}
						}
					}
				}
			}
		}

	}

	return results;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Goes through data of a certain month and computes its average
int getMonthAvr(ArrayList<String> entries, int room){
	int sum = 0;
	for(int i =1 ; i<entries.size();i++){
		sum+=Integer.parseInt(entries.get(i));
	}
	return (sum/ entries.size());
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Similar to drawing the data of month and day, this one draws the data of a certain year
void drawYearTemps(int room){
  Integrator [] interpolator = interpolatorsList.get(2);
	if(room == 1)
		stroke(0);
	else{
		if(room == 2)
			stroke(#ff0000);
		else{
			if(room == 3)
				stroke(#7FFF00);
			else{
				if(room == 4)
					stroke(#FF83FA);

				else{
					if(room == 5)
						stroke(#00BFFF);
					else{
						if(room == 6)
							stroke(#9B30FF);
						else{
							stroke(#008B00);
						}

					}

				}

			}

		}

	}

	if(view == 4){
		String startMonth = "Jan";
		int count = 1;
		int i = 0;
		int lastValue = 0;
		beginShape();
		ArrayList<ArrayList<String>> results = getYear(room);

		while(i<results.size()&&count < 14){
			ArrayList<String> monthResult = results.get(i);       
			if(monthResult.isEmpty()){
;
			}else{
				if(monthResult.get(0).equals(startMonth)){
					if(room == roomSelected)
						strokeWeight(6);
					else
						strokeWeight(2);
					int value = getMonthAvr(monthResult, room);
					lastValue = value;
float y;
		if(room == roomSelected){
      interpolator[count-1].target(lastValue);
		if(minHere>lastValue)
       minHere = lastValue;
       else
       if(maxHere<lastValue)
       maxHere = lastValue;		
                                											
y = map(interpolator[count-1].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lastValue,mintemp,maxtemp,plotY2,plotY1);
}

                			float x = map(count,1,12,plotX1,plotX2-5); 
					vertex(x,y);
					count++;
					i++;

				}   
				else{

					if(room == roomSelected)
						strokeWeight(6);
					else
						strokeWeight(2);

					if(lastValue != 0){
float y;
  		if(room == roomSelected){
      interpolator[count-1].target(lastValue);
		if(minHere>lastValue)
       minHere = lastValue;
       else
       if(maxHere<lastValue)
       maxHere = lastValue;		
				
                                											
y = map(interpolator[count-1].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(lastValue,mintemp,maxtemp,plotY2,plotY1);
}

                			float x = map(count,1,12,plotX1,plotX2-5); 
						vertex(x,y);


					}
					count++;
				}

			}


			if(startMonth.equals("Jan")){
				startMonth = "Feb";
			}
			else{
				if(startMonth.equals("Feb")){
					startMonth = "Mar";
				}
				else{
					if(startMonth.equals("Mar")){
						startMonth = "Apr";
					}
					else{
						if(startMonth.equals("Apr")){
							startMonth = "May";
						}
						else{
							if(startMonth.equals("May")){
								startMonth = "Jun";
							}
							else{
								if(startMonth.equals("Jun")){
									startMonth = "Jul";
								}
								else{
									if(startMonth.equals("Jul")){
										startMonth = "Aug";
									}
									else{
										if(startMonth.equals("Aug")){
											startMonth = "Sep";
										}
										else{

											if(startMonth.equals("Sep")){
												startMonth = "Oct";
											}
											else{
												if(startMonth.equals("Oct")){
													startMonth = "Nov";
												}
												else{
													if(startMonth.equals("Nov")){
														startMonth = "Dec";
													}
												}

											}}
									}
								}
							}
						}
					}
				}
			}
		}
		endShape();
	}}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This mehtod draws the data of a certain month in all available years to be easily compared (same algorithm as drawMonth)
void compareMonths(){

	int yr = yearSelected;
	yearSelected = 2005;
	while(yearSelected < 2012){
		if(yearSelected == 2005)
			stroke(#00008B);
		else{
			if(yearSelected == 2006)
				stroke(#4169E1);
			else{
				if(yearSelected == 2007)
					stroke(#87CEFA);
				else{
					if(yearSelected == 2008)
						stroke(#008B45);

					else{
						if(yearSelected == 2009)
							stroke(#FF82AB);
						else{
							if(yearSelected == 2010)
								stroke(#00EE76);
							else{

  								stroke(0);
							}

						}

					}

				}

			}

		}
Integrator[] interpolator = interpolatorsList.get(3);
		String monthabr = monthSelected.substring(0, 3);

		int dayCount = 0;
		if(monthabr.equals("Feb")){
			dayCount = 28;
		}else{
			if(monthabr.equals("Jan")||monthabr.equals("Mar")||monthabr.equals("May")||monthabr.equals("Jul")||monthabr.equals("Aug")||monthabr.equals("Oct")||monthabr.equals("Dec"))
				dayCount = 31;
			else
				dayCount = 30;
		}
		ArrayList<ArrayList<ArrayList<String>>> results = getMonth(monthSelected);
		if(!results.isEmpty()){
			beginShape();
			int count = 0;
			int i = 0;
			while(i<results.size() && count <dayCount){        
				String entry = results.get(i).get(0).get(1);
				if(entry.length()== 11)
					entry = entry.substring(4,6);
				else
					entry = ""+entry.charAt(4);
				if(Integer.parseInt(entry)- count == 1){
					int value = getDayAvg(results.get(i),roomSelected);
					noFill();
					if(yr == yearSelected)
						strokeWeight(6);
					else
						strokeWeight(2);
					float y;
		if(yearSelected == yr){
      interpolator[count].target(value);
				
                                											
y = map(interpolator[count].value,mintemp,maxtemp,plotY2,plotY1);}
else{
y = map(value,mintemp,maxtemp,plotY2,plotY1);
}
float x = map(count,0,dayCount-1,plotX1,plotX2-5); 
					vertex(x,y);
					count++;
					i++;
				}else{
					count++;		
				}
			}
			endShape();
		}
		yearSelected++;
	}
	yearSelected = yr;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This method draws the high and low temperatures outside of a certain month.
void findMonthChicago(){
	int monthno = 0;
	int dayCount = 0;
	strokeWeight(2);
	if(monthSelected.equals("January")){
		monthno = 1;
		dayCount = 31;
	}else{
		if(monthSelected.equals("February")){
			monthno = 2;
			if(yearSelected == 2008)
				dayCount = 29;
			else
				dayCount = 28;
		}else{
			if(monthSelected.equals("March")){
				monthno = 3;
				dayCount = 31;
			}
			else{
				if(monthSelected.equals("April")){
					monthno = 4;
					dayCount = 30;
				}else{
					if(monthSelected.equals("May")){
						monthno = 5;
						dayCount = 31;
					}else{
						if(monthSelected.equals("June")){
							monthno = 6;
							dayCount = 30;
						}else{
							if(monthSelected.equals("July")){
								monthno = 7;
								dayCount = 31;
							}else{
								if(monthSelected.equals("August")){
									monthno = 8;
									dayCount = 31;
								}else{
									if(monthSelected.equals("September")){
										monthno = 9;
										dayCount = 30;
									}else{
										if(monthSelected.equals("October")){
											monthno = 10;
											dayCount = 31;
										}else{
											if(monthSelected.equals("November")){
												monthno = 11;
												dayCount = 30;
											}else{
												if(monthSelected.equals("December")){
													monthno = 12;
													dayCount = 31;
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	boolean done = false;
	int i;
	String date = ""+yearSelected+"-"+monthno+"-"+1;
	for( i = 0; i<outside.size()&& !done;i++){
		if(outside.get(i).get(0).equals(date)){
			done = true;
		}
	}
	int i2 = i-1;
	stroke(#DC143C);
	beginShape();
	for(int j = 1; j<dayCount+1;j++){
		ArrayList<String> dayi = outside.get(i2);
		int value = Integer.parseInt(dayi.get(1));
		noFill();
		float y = map(value,-7,100,plotY2,plotY1);
		float x = map(j,1,dayCount,plotX1,plotX2-5); 
		vertex(x,y);
		i2++;
	}
	i = i -1;
	endShape();
	stroke(#FF82AB);
	beginShape();
	for(int j = 1; j<dayCount+1;j++){
		ArrayList<String> dayi = outside.get(i);
		int value = Integer.parseInt(dayi.get(2));
		noFill();
		float y = map(value,-7,100,plotY2,plotY1);
		float x = map(j,1,dayCount,plotX1,plotX2-5); 
		vertex(x,y);
		i++;
	}
	endShape();

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// drawLegend() Method draws the colou legend according to the view
void drawLegend(){
  if((view == 2 || view == 3 || view == 4 )&&showing){
  fill(255);
  noStroke();
  
  rect(5,480,125,650);
  
  fill(#ff0000);
  stroke(#ff0000);
  rect(10, 490, 25,500);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Main Lab", 70, 500);
  textAlign(CENTER);
  
  fill(#ff83fa);
  stroke(#ff83fa);
  rect(10, 510, 25,520);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Lounge", 70, 520);
  textAlign(CENTER);
  
  fill(#00bfff);
  stroke(#00bfff);
  rect(10, 530, 25,540);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Prototype Space", 75, 540);
  textAlign(CENTER);
  
  fill(#7fff00);
  stroke(#7fff00);
  rect(10, 550, 25,560);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Machine Room", 75, 560);
  textAlign(CENTER);
  
  fill(#9B30FF);
  stroke(#9B30FF);
  rect(10, 570, 25,580);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Classroom", 70, 580);
  textAlign(CENTER);
  
  fill(0);
  stroke(0);
  rect(10, 590, 25,600);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Meeting Room", 75, 600);
  textAlign(CENTER);
  
  fill(#008B00);
  stroke(#008B00);
  rect(10, 610, 25,620);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Office Space", 75, 620);
  textAlign(CENTER);
    
}
if(view == 5){
 fill(255);
  noStroke();
  
  rect(5,480,125,650);
  
  fill(#00008b);
  stroke(#00008B);
  rect(10, 490, 25,500);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text(monthSelected + " 2005", 70, 500);
  textAlign(CENTER);
 
  fill(#4169E1);
  stroke(#4169E1);
  rect(10, 510, 25,520);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text(monthSelected + " 2006", 70, 520);
  textAlign(CENTER);
 
fill(#87CEFA);
  stroke(#87CEFA);
  rect(10, 530, 25,540);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text(monthSelected + " 2007", 70, 540);
  textAlign(CENTER);
 
 fill(#008B45);
  stroke(#008B45);
  rect(10, 550, 25,560);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text(monthSelected + " 2008", 70, 560);
  textAlign(CENTER);
 
 fill(#ff82ab);
  stroke(#ff82ab);
  rect(10, 570, 25,580);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text(monthSelected + " 2009", 70, 580);
  textAlign(CENTER);
 
  fill(#00ee76);
  stroke(#00ee76);
  rect(10, 590, 25,600);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text(monthSelected + " 2010", 70, 600);
  textAlign(CENTER);
 
 fill(0);
  stroke(0);
  rect(10, 610, 25,620);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text(monthSelected + " 2011", 70, 620);
  textAlign(CENTER);
 
}

if(view == 6){
 fill(255);
  noStroke();
  
  rect(5,480,125,650);
  fill(#dc143c);
  stroke(#dc143c);
 
  rect(10, 490, 25,500);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Chicago HIGH", 70, 500);
  textAlign(CENTER);
 
  if(roomSelected == 1){
  fill(0);
  stroke(0);
  }
  if(roomSelected == 2){
  fill(#ff0000);
  stroke(#ff0000);
  
  }
  if(roomSelected == 3){
  fill(#7fff00);
  stroke(#7fff00);
  
  }
  if(roomSelected ==  4){
  fill(#ff83fa);
  stroke(#ff83fa);
  
  }
  if(roomSelected == 5){
  fill(#00bfff);
  stroke(#00bfff);
  
  }
  if(roomSelected == 6){
  fill(#9b30ff);
  stroke(#9b30ff);
  
  }
  if (roomSelected == 7){
  fill(#008b00);
  stroke(#008b00);
  
  }
  
  rect(10, 520, 25,530);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Room\nTemperature", 70, 520);
  textAlign(CENTER);
 
fill(#ff82ab);
  stroke(#ff82ab);
  rect(10, 550, 25,560);
  fill(0);
  textAlign(CENTER);
  textSize(12);
  text("Chicago LOW", 70, 560);
  textAlign(CENTER);
}

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This methos draws the rollover box that appears when the user points over the table button
void drawTable(){
  if(view == 1){
  fill(#87CEFA);
  stroke(0);
  strokeWeight(2);
  rect(620,200,400,300);
  textSize(18);
  noStroke();
  textAlign(CENTER);
  fill(0);
 
    text("Highest Temperature Reached Ever = 92 F\n Thurs Mar 17, 2007 9PM - 11PM\n Prototype Space (Room #5)\n\nLowest Temperature Reached Ever = 32 F\n Fri Dec 24, 2009 10AM\nOffice Space (Room #7)", 820, 300);

}
if(view == 2){
  fill(#87CEFA);
  //noStroke();
  stroke(0);
  strokeWeight(2);
  rect(500,200,1020,500);
  textSize(18);
  noStroke();
  textAlign(CENTER);
  fill(0);
 
  textSize(18);
  text("Highest Temperature Reached Ever = 92 F\n Thurs Mar 17, 2007 9PM - 11PM\n Prototype Space (Room #5)\n\nLowest Temperature Reached Ever = 32 F\n Fri Dec 24, 2009 10AM\nOffice Space (Room #7)\n\n Maximum Temperature Reached on that day(in that room): "+maxHere+"F\n\nMin Temperature reached on that day (in that room):"+minHere+"F", 760, 220);
}
if(view == 3 || view == 5||view == 6){
  fill(#87CEFA);
  //noStroke();
  stroke(0);
  strokeWeight(2);
  rect(400,200,1020,500);
  textSize(18);
  noStroke();
  textAlign(CENTER);
  fill(0);
 
  textSize(18);
  text("Highest Temperature Reached Ever = 92 F\n Thurs Mar 17, 2007 9PM - 11PM\n Prototype Space (Room #5)\n\nLowest Temperature Reached Ever = 32 F\n Fri Dec 24, 2009 10AM\nOffice Space (Room #7)\n\n Maximum AverageTemperature Reached in that month(in that room): "+maxHere+"F\n\nMin AverageTemperature reached in that month (in that room):"+minHere+"F", 720, 220);


}
if(view == 4){
  fill(#87CEFA);
  //noStroke();
  stroke(0);
  strokeWeight(2);
  rect(400,200,1020,500);
  textSize(18);
  noStroke();
  textAlign(CENTER);
  fill(0);
 
  textSize(18);
  text("Highest Temperature Reached Ever = 92 F\n Thurs Mar 17, 2007 9PM - 11PM\n Prototype Space (Room #5)\n\nLowest Temperature Reached Ever = 32 F\n Fri Dec 24, 2009 10AM\nOffice Space (Room #7)\n\n Maximum Average Temperature Reached in that year(in that room): "+maxHere+"F\n\nMin Average Temperature reached in that year (in that room):"+minHere+"F", 720, 220);


}
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// PHEW! The end of my first visualization! Thanks for your patience! Best regards,
//                                                                                 Heba Basiony

