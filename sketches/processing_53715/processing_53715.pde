
import org.json.*;
	//// timer
		int theTimer = 0;
		int theCounter;

		int readoutX = 100;
		int readoutY = 390;
		PImage img; // Background image
		Map theMap;
		//// PFont font; // Text font
		// PFont SanSerif;
		
		PApplet pApp;
	
	/// master array
		String masterArray[]; /// array that holds all the days in the timeline
		int userArray[];
		
		/// length of the lat/long arrays
		int userLatLongLength;
		int shareLatLongLength;
		int pandaLatLongLength;
		
		UserProfile[] profileArray; // Array of cities

		////array to hold the lattitude, longitude, and date for users
		float[] latUserArray;
		float[] longUserArray;
		String[] dateUserArray;

	////array to hold the lattitude, longitude, and date for shares
		float[] latShareArray;
		float[] longShareArray;
		String[] dateShareArray;


		float[] latPandaArray;
		float[] longPandaArray;
		
		//
		JSONArray results;
		JSONObject dbData;
		///
		Boolean doShare = false;
		Boolean doUser = true;
		Boolean doLocation = true;
		Boolean querySuccess = false;

		String thePath = "data/tubeMapData.txt";
		////game type data
		int gameID = 0;
		

		boolean locked = false;
		////
		int baseRange = 0; /// current date

		public void setup() {

			  // theMap = Map.getInstance();
			  size(512, 160);
			  pApp = this;
			  size(512, 160);
			  colorMode(RGB);
			  frameRate(8);    
			  smooth();
			  img = loadImage("data/london_map.jpg"); // Load us map

			  // parseLocation(gameID);
			  populateMasterArray();

			  
			}
		
		public void draw() {
			/// add the image of the map
			 /// background(img);
			  image(img, 0, 0);
			  // Display the cities on the map
			  if(querySuccess){
				buildMap();

			  }
			  if(theTimer <=0){
				  theTimer = 1;
				  // println("EXECUTE");
				  runHits(theCounter);
			  } else {
				  theTimer --;
			  }

		}
		public void populateMasterArray(){
			/// populate the master array
			
			println(thePath);
			try{
			dbData = new JSONObject(join(loadStrings(thePath), ""));
			// println("results: " + result);
			// results = dbData.getJSONArray("userLocation");
			results = dbData.getJSONArray("latlong_data");
			userLatLongLength =  results.length();
			/// Initialize the arrays
			dateUserArray = new String[results.length()];
			profileArray = new UserProfile[userLatLongLength];
			

			 /// populate the city array
		     for (int j = 0; j < userLatLongLength; j++) {
			    String theLat = results.getJSONObject(j).getString("lat");
			    String theLong = results.getJSONObject(j).getString("long");
			    String theStation = results.getJSONObject(j).getString("Station");
			     profileArray[j] = new UserProfile(pApp, theLong, theLat, theStation);
			    
		     }

			} catch (JSONException e){
			println(e);
			}
			theCounter = 0; // profileArray.length-1;
			querySuccess = true;
			// println(userLatLongLength);
	}
		
		public void buildMap(){
			 for (int j = 0; j < userLatLongLength; j++) {
					 profileArray[j].showMarker();
			 }
		}

		public void runHits(int theNum){
			if(theCounter>= profileArray.length-1){
				theCounter = 0;
			}
			 profileArray[theNum].doHit();
			 theCounter++;
			
			// doReadout();
		}

///



