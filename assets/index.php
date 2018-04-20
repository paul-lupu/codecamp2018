<html>
	<head>
	<style>
		body {
			background-image:url("images/codecamp.png"); 
			background-repeat: no-repeat;
			background-position: top center;
					}
		h1   {color: cyan;}
	</style>
	</head>
  <body>
    <h1>
			<center>
				 <?php
				$servername = "mysql1";
				$username = "codecamp";
				$password = "codecamp";

				// Create connection
				$conn = new mysqli($servername, $username, $password);

				// Check connection
				if ($conn->connect_error) {
						die("Connection failed: " . $conn->connect_error);
				}
				$sql="SELECT * FROM codecamp.messages;";

				$result=$conn->query($sql);

				while($row = $result->fetch_assoc()) {
								echo "Message from database: ". $row['message']. "<br>";
						}
				?> 
			<center>
	 </h1>
  <body>
</html>
