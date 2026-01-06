# Train-Delay-Passenger-Flow-Analytics

<p><strong>End-to-end Data Analyst project using MySQL + Python (Pandas/Matplotlib/SQLAlchemy)</strong></p>

<p>This project analyzes real-world railway delay data to identify:</p>
<ul>
  <li>Most delayed trains and stations</li>
  <li>Punctuality performance</li>
  <li>Cancellation & significant delay risk</li>
  <li>Station performance leaderboard</li>
</ul>

<hr>

<h2>🧰 Tech Stack</h2>
<ul>
  <li><strong>Database:</strong> MySQL</li>
  <li><strong>Languages:</strong> Python, SQL</li>
  <li><strong>Libraries:</strong> Pandas, Matplotlib, SQLAlchemy, python-dotenv</li>
  <li>Jupyter Notebook or VS Code</li>
</ul>

<hr>

<h2>📊 Dataset</h2>

<p>Real train delay dataset with fields:</p>

<table>
<thead>
<tr><th>Column</th><th>Description</th></tr>
</thead>
<tbody>
<tr><td>train_number</td><td>Train number</td></tr>
<tr><td>train_name</td><td>Name of the train</td></tr>
<tr><td>station_code</td><td>Station short code</td></tr>
<tr><td>station_name</td><td>Station name</td></tr>
<tr><td>average_delay_minutes</td><td>Average delay (minutes)</td></tr>
<tr><td>pct_right_time</td><td>Right-time percentage</td></tr>
<tr><td>pct_slight_delay</td><td>Slight delay percentage</td></tr>
<tr><td>pct_significant_delay</td><td>Significant delay percentage</td></tr>
<tr><td>pct_cancelled_unknown</td><td>Cancellation percentage</td></tr>
<tr><td>scraped_at</td><td>Data collection timestamp</td></tr>
<tr><td>source_url</td><td>Original dataset reference</td></tr>
</tbody>
</table>

<p><strong>Table used:</strong> <code>real_train_delays</code></p>

<hr>

<h2>🎯 Project Objectives</h2>
<ul>
  <li>Perform SQL-based exploratory analysis</li>
  <li>Identify delay-prone trains and stations</li>
  <li>Build analytical SQL views</li>
  <li>Visualize results using Python</li>
  <li>Demonstrate complete data analyst workflow</li>
</ul>

<hr>

<h2>🗂 Project Structure</h2>

<pre>
Train-Delay-Analytics/
 ├── README.md
 ├── train_analysis.sql
 ├── analysis.ipynb
 ├── delay_visuals.py
 ├── dataset.csv
 └── requirements.txt
</pre>

<hr>

<h2>🔐 Environment Variables (.env)</h2>

<p>This project uses a <code>.env</code> file to keep database passwords hidden.</p>

<pre>
DB_USER=root
DB_PASS=your_password
DB_NAME=train_analysis
DB_HOST=localhost
DB_PORT=3306
</pre>

<p><strong>Note:</strong> <code>.env</code> is excluded using <code>.gitignore</code> and must NOT be pushed to GitHub.</p>

<hr>

<h2>🚀 How to Run Locally</h2>

<ol>
<li>Clone the repository</li>
<pre>git clone https://github.com/YOUR-USERNAME/Train-Delay-Passenger-Flow-Analytics.git</pre>

<li>Open project folder</li>
<pre>cd Train-Delay-Passenger-Flow-Analytics</pre>

<li>Create the database in MySQL</li>
<pre>
CREATE DATABASE train_analysis;
USE train_analysis;
</pre>

<li>Create table using provided SQL script</li>

<li>Import dataset using MySQL Workbench
<ul>
<li>Right-click table → <strong>Table Data Import Wizard</strong></li>
</ul>
</li>

<li>Create <code>.env</code> file (format shown above)</li>

<li>Install Python requirements</li>
<pre>pip install -r requirements.txt</pre>

<li>Run notebook or Python script</li>
</ol>

<hr>

<h2>📊 Core SQL Analysis Performed</h2>

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
<li>Delay distribution</li>
<li>Top delayed trains</li>
<li>Punctuality vs delay scatter plot</li>
<li>Worst station delays</li>
</ul>

<pre>
df["average_delay_minutes"].hist(bins=40)
</pre>

<hr>

<h2>🛡 Security Notes</h2>

<ul>
<li>Passwords are never committed</li>
<li>.env is ignored using .gitignore</li>
<li>Use non-root DB user for production</li>
</ul>

<hr>

<h2>🧑‍💻 Skills Demonstrated</h2>

<ul>
<li>SQL data modeling and querying</li>
<li>Joins, grouping, aggregation, ranking</li>
<li>Python data analysis</li>
<li>SQL-Python connectivity (SQLAlchemy)</li>
<li>Visualization and storytelling</li>
<li>Git & GitHub best practices</li>
</ul>

<hr>

<h2>🏁 Results Summary</h2>

<ul>
<li>Identified most delayed trains and stations</li>
<li>Measured network punctuality</li>
<li>Detected cancellation-prone trains</li>
<li>Visualized delay patterns</li>
</ul>

<hr>

<h2>🚀 Future Enhancements</h2>

<ul>
<li>Machine learning delay prediction</li>
<li>Time-series forecasting</li>
<li>Power BI / Tableau dashboard</li>
<li>Interactive Streamlit web app</li>
<li>Geospatial heatmaps</li>
</ul>

<hr>

<h2>👤 Author</h2>
<p><strong>Lakshay Mittal</strong><br>
