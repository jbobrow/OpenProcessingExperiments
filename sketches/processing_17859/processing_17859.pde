
/* File name filter utility class to filer only compatible image files from a directory */
import java.io.*; 
public class ExtFilter implements FilenameFilter { 
String ext; 

public boolean accept(File dir, String name) { 
  
name = name.toLowerCase();

return (name.endsWith("jpeg")||name.endsWith("jpg")) ; 
} 
}



