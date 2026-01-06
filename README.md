# Train-Delay-Passenger-Flow-Analytics
<h1>🚆 Train Delay & Passenger Flow Analytics (SQL + Python)</h1>

<p><strong>End-to-end Data Analyst Project using MySQL + Python (Pandas/Matplotlib)</strong></p>

<p>This project analyzes real-world railway delay data to uncover:</p>
<ul>
  <li>Most delayed trains and stations</li>
  <li>Punctuality performance</li>
  <li>Cancellation patterns</li>
  <li>Significant-delay risk</li>
  <li>Station-wise performance leaderboard</li>
</ul>

<hr>

<h2>🧰 Tech Stack</h2>
<ul>
  <li><strong>SQL:</strong> MySQL</li>
  <li><strong>Python:</strong> Pandas, Matplotlib, SQLAlchemy</li>
  <li>Jupyter Notebook / VS Code</li>
</ul>

<hr>

<h2>📊 Dataset</h2>

<p>Real Indian train delay dataset containing the following fields:</p>

<table>
<thead>
<tr>
<th>Column</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr><td>train_number</td><td>Train ID number</td></tr>
<tr><td>train_name</td><td>Name of the train</td></tr>
<tr><td>station_code</td><td>Station short code</td></tr>
<tr><td>station_name</td><td>Full station name</td></tr>
<tr><td>average_delay_minutes</td><td>Average delay (minutes)</td></tr>
<tr><td>pct_right_time</td><td>% of on-time arrivals</td></tr>
<tr><td>pct_slight_delay</td><td>% of slight delays</td></tr>
<tr><td>pct_significant_delay</td><td>% of major delays</td></tr>
<tr><td>pct_cancelled_unknown</td><td>% cancellations</td></tr>
<tr><td>scraped_at</td><td>Data scraped timestamp</td></tr>
<tr><td>source_url</td><td>Original source link</td></tr>
</tbody>
</table>

<p><strong>Table name in MySQL:</strong> <code>real_train_delays</code></p>

<hr>

<h2>🎯 Project Objectives</h2>

<ul>
  <li>Perform exploratory SQL analysis</li>
  <li>Identify high-delay trains and stations</li>
  <li>Build SQL summary views</li>
  <li>Create Python visualizations</li>
  <li>Demonstrate end-to-end data analytics skills</li>
</ul>

<hr>

<h2>🗂 Project Structure</h2>

<pre>
train-delay-analytics/
 ├── README.html
 ├── train_analysis.sql
 ├── analysis.ipynb
 ├── delay_visuals.py
 ├── dataset.csv
</pre>

<hr>

<h2>🛠️ Setup Instructions</h2>

<h3>1️⃣ Create MySQL Database</h3>

<pre>
CREATE DATABASE train_analysis;
USE train_analysis;
</pre>

<h3>2️⃣ Create Table</h3>
<p>(Already included in SQL file)</p>

<h3>3️⃣ Import Dataset</h3>
<p>In MySQL Workbench:</p>
<ol>
<li>Right-click table</li>
<li>Select <strong>Table Data Import Wizard</strong></li>
<li>Upload CSV file</li>
</ol>

<h3>4️⃣ Connect Python to MySQL</h3>

<pre>
engine = create_engine(
 "mysql+mysqlconnector://root:YOURPASSWORD@localhost/train_analysis"
)
</pre>

<hr>

<h2>📊 Key SQL Queries</h2>

<h3>🔥 Top 10 Most Delayed Trains</h3>
<pre>
SELECT train_number, train_name,
AVG(average_delay_minutes) AS avg_delay
FROM real_train_delays
GROUP BY train_number, train_name
ORDER BY avg_delay DESC
LIMIT 10;
</pre>

<h3>🚉 Worst Stations by Average Delay</h3>
<pre>
SELECT station_name,
AVG(average_delay_minutes) AS avg_delay
FROM real_train_delays
GROUP BY station_name
ORDER BY avg_delay DESC
LIMIT 15;
</pre>

<h3>🟢 Best On-Time Trains</h3>
<pre>
SELECT train_number, train_name,
AVG(pct_right_time) AS on_time_rate
FROM real_train_delays
GROUP BY train_number, train_name
ORDER BY on_time_rate DESC
LIMIT 10;
</pre>

<hr>

<h2>📈 Python Visualizations</h2>

<ul>
<li>Delay distribution histogram</li>
<li>Worst stations bar chart</li>
<li>Top delayed trains bar chart</li>
<li>Punctuality vs delay scatter plot</li>
</ul>

<pre>
df["average_delay_minutes"].hist(bins=40)
</pre>

<hr>

<h2>🧑‍💻 Skills Demonstrated</h2>

<ul>
<li>SQL data modeling and querying</li>
<li>Data cleaning & aggregation</li>
<li>Python-based analysis</li>
<li>Database connectivity (SQLAlchemy)</li>
<li>Data visualization & storytelling</li>
<li>Handling large real-world datasets</li>
</ul>

<hr>

<h2>🏁 Results Summary</h2>

<ul>
<li>Identified most delayed trains & stations</li>
<li>Measured network punctuality performance</li>
<li>Highlighted cancellation-prone trains</li>
<li>Visualized delay distribution</li>
</ul>

<hr>

<h2>🚀 Future Improvements</h2>

<ul>
<li>Machine learning delay prediction model</li>
<li>Power BI / Tableau dashboard</li>
<li>Geospatial heatmap visualization</li>
<li>Real-time streaming analytics</li>
<li>Streamlit web application</li>
</ul>

<hr>

<h2>👤 Author</h2>

<p><strong>Lakshay Mittal</strong><br>
