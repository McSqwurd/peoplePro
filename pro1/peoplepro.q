// TEST FILE

// Function to load in CSV Data
loadCSV:{[filePath; types]  (types; enlist ",") 0: hsym[filePath] }     /Returns Table


// Calling Function to return csv data table
tab1:loadCSV[`:people.csv; "ISSSSSSDSS"]


// Resetting column names to avoid spacing error
tab1:`Index`User_ID`First_Name`Last_Name`Sex`Email`Phone`DOB`Job xcol tab1


// Function to get person given first name
getPersonFN:{[table;firstN] select from table where First_Name=firstN}


// Function to change persons first name to specified
changeFirstName:{[table; name; newName];

		// Get table of person in question
		tabOfPers:select from (value table) where First_Name=name;

		// Returns a list of given indexs for where that person is on table
		vals:(value flip (select Index from tabOfPers) -\ 1);
		show vals;

		// Returns table where first name of person is changed to specified 
		table: show update First_Name: newName from (value table) where i in first vals
		}


// Function to return people born in a specified year (string input)
searchYOB:{[table; birthYear] 

		// Function to return list of possible birth years from table 
		yearL:(4#' (string (exec DOB from (value table))));	

		// List of indexs where year occurs
		idxLis:(group yearL)[birthYear];

		// Return table of people born in specified birth year 
		select from (value table) where i in idxLis 
		} 






















 



 
