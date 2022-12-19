import psycopg2

DBNAME = 'postgres'
USER = 'postgres'
PASSWORD = 'admin'
HOST = 'localhost'

class PostgresClient:

    def select_category(self):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute("SELECT category FROM meals GROUP BY category")
                return cur.fetchall()

    def select_all_meals(self):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute("SELECT meal FROM meals ")
                return cur.fetchall()

    def select_meal(self, category):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute(f"SELECT meal FROM meals WHERE category = '{category}'")
                return cur.fetchall()

    def get_detail_meal(self, detail, meal):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute(f"SELECT {detail} FROM meals WHERE meal = '{meal}'")
                return cur.fetchall()

    def btn_top(self, usertg, userid, meal, category):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute('''INSERT INTO btntop (usertg, userid, meal, category, datetime) values (%s, %s, %s, %s, NOW())''', (usertg, userid, meal, category))
                return self.con.commit()

    def msg_handler(self, usertg, userid, message):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute('''INSERT INTO msghandler (usertg, userid, msg, datetime) values (%s, %s, %s, NOW())''', (usertg, userid, message))
                return self.con.commit()

    def count_msg(self, userid):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute(f"SELECT count(userid) FROM msghandler WHERE userid = '{userid}' group by userid")
                return cur.fetchall()

    def delete_msg(self, userid):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute(f"DELETE FROM msghandler WHERE datetime = (SELECT min(datetime) FROM msghandler WHERE userid = '{userid}')")
                return self.con.commit()

    def top(self, meal_category_user, top):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute(f'''SELECT {meal_category_user}, count({meal_category_user}) as top FROM btntop
                                GROUP BY {meal_category_user}
                                ORDER BY top DESC LIMIT {top}''')
                return cur.fetchall()

    def top_week_month(self, meal_category_user, days, top):
        with psycopg2.connect(dbname=DBNAME, user=USER, password=PASSWORD, host=HOST) as self.con:
            with self.con.cursor() as cur:
                cur.execute(f'''SELECT {meal_category_user}, count({meal_category_user}) as top FROM btntop
                                WHERE (date(now()) - date(datetime)) <= {days}
                                GROUP BY {meal_category_user}
                                ORDER BY top DESC LIMIT {top}''')
                return cur.fetchall()

PG_client = PostgresClient()


