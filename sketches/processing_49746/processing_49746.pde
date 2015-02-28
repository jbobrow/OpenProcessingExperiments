
/*

SimpleSpreadsheetManager Class
blprnt@blprnt.com
July, 2009

This is a quick & dirty class for accessing data from the Google Spreadsheet API.


*/

import com.google.gdata.client.spreadsheet.*;
import com.google.gdata.data.*;
import com.google.gdata.data.spreadsheet.*;
import com.google.gdata.util.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class SimpleSpreadsheetManager {

  SpreadsheetService myService;
  SpreadsheetEntry spreadsheetEntry;
  SpreadsheetFeed sheetFeed;
  WorksheetEntry worksheetEntry;

  List spreadsheets;

  String user;
  String pass;
  
  ListFeed currentListFeed;
  CellFeed currentCellFeed;
  List currentCells;
  List currentListEntries;
  
  int currentTotalRows;
  int currentTotalCols;
  
  String currentTitle;


  SimpleSpreadsheetManager() {
    
  };
  
  /*
  
  INIT FUNCTION
  Opens session, uses username & password for authentication
  
  */

  void init(String sessionName, String u, String p) {
    user = u;
    pass = p;
    myService = new SpreadsheetService(sessionName);
    try {
      myService.setUserCredentials(user, pass);
    } 
    catch (Exception e) {
      println("ERROR IN AUTHENTICATION");
      UserFinished=false;
      PassFinished=false;
      isFinished=false;
    };

  };
  
  /*
  
  FETCH SHEET BY KEY
  Gets a spreadsheet listfeed using the unique key - this is in the URL of the spreadsheet
  The retrieved sheet is both returned and set as the currentListFeed
  
  */
  
  ListFeed fetchSheetByKey(String k, int wi) {
    
    ListFeed f = new ListFeed();
    CellFeed cf = new CellFeed();
    WorksheetFeed w = new WorksheetFeed();
    //GET WORKSHEETS FEED
    try {
      URL worksheetFeedUrl = new URL("http://spreadsheets.google.com/feeds/worksheets/" + k + "/private/full");
      WorksheetFeed wf2 = new WorksheetFeed();
      w = myService.getFeed(worksheetFeedUrl, wf2.getClass());
    }
    catch(Exception e) {
      println("ERROR RETRIEVING WORKSHEET FEED");
    };
    

    List worksheets = w.getEntries();
    WorksheetEntry we = (WorksheetEntry) worksheets.get(wi);   
    println("RETRIEVED WORKSHEET " + we.getTitle().getPlainText()); 
    
    //GET LIST FEED URL
    try {
      URL listFeedUrl = we.getListFeedUrl();//new URL("http://spreadsheets.google.com/feeds/list/" + k + "/od6/private/full");
      ListFeed lf2 = new ListFeed();
      f = myService.getFeed(listFeedUrl, lf2.getClass());
    }
    catch(Exception e) {
      println("ERROR RETRIEVING LIST FEED");
    };
    
    //GET CELL FEED
    try {
      URL cellFeedUrl = we.getCellFeedUrl();//new URL("http://spreadsheets.google.com/feeds/cells/" + k + "/od6/private/full");
      CellFeed lf2 = new CellFeed();
      cf = myService.getFeed(cellFeedUrl, lf2.getClass());

    }
    catch(Exception e) {
      println("ERROR RETRIEVING LIST FEED");
    };
    
    currentListFeed = f;
    currentCellFeed = cf;
    currentCells = cf.getEntries();
    currentListEntries = f.getEntries();
    
    currentTitle = we.getTitle().getPlainText();
    currentTotalRows = currentListEntries.size();
    ListEntry le = (ListEntry) currentListEntries.get(0);  
    currentTotalCols = le.getCustomElements().getTags().size();
    return(f);
  };
  
  /*
  
  GET CELL VALUE
  Returns the value held in an individual sheet cell.
  
  */
  
  String getCellValue(int c, int r) {

    ListEntry le = (ListEntry) currentListEntries.get(r);    
    Set<String> tags = le.getCustomElements().getTags();
    String[] tagArray = new String[tags.size()];
    tagArray = tags.toArray(tagArray);
  
    return(le.getCustomElements().getValue(tagArray[c]));
   
  };
  
  String getCellValue(String tag, int r) {
 
    ListEntry le = (ListEntry) currentListEntries.get(r);    
    return(le.getCustomElements().getValue(tag));
   
  };
  


};





