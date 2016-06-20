package mongodb.sample01;

import static spark.Spark.get;

import java.net.UnknownHostException;

import org.bson.Document;

import com.mongodb.*;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

/**
 * Hello world!
 *
 */
public class App 
{
	public static void main(String[] args) {
		App app = new App();
        get("/mongodb/sample01", (req, res) -> { return app.getDogName(); });
    }
	
	public Document getDog() throws UnknownHostException {
		MongoClient client = new MongoClient("localhost");
		try {
			MongoDatabase database = client.getDatabase("samples");
			MongoCollection<Document> collection = database.getCollection("dogs");
			FindIterable<Document> docsIterator = collection.find();
			return docsIterator.first();
		} finally {
			client.close();
		}
	}
	
	public String getDogName() throws UnknownHostException {
		Document dog = this.getDog();
		return dog.getString("name").toString();
	}
}
