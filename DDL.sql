-- 資産形成アプリ連携データ
CREATE TABLE "users" (
  "id" varchar(16) NOT NULL,
  "age" integer NOT NULL,
  "gender" integer NOT NULL,
  "prefecture" integer NOT NULL,
  "residential_type" integer NOT NULL,
  "has_housing_loan" bool,
  "industry" integer NOT NULL,
  "occupation" integer NOT NULL,
  "annual_income" numeric(10,2) NOT NULL,
  "current_saving" numeric(10,2) NOT NULL,
  "reserve_amount" numeric(10,2) NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "users_pk" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "users"."id" IS 'ID';
COMMENT ON COLUMN "users"."age" IS '年齢';
COMMENT ON COLUMN "users"."gender" IS '性別';
COMMENT ON COLUMN "users"."prefecture" IS '都道府県';
COMMENT ON COLUMN "users"."residential_type" IS '住居形態';
COMMENT ON COLUMN "users"."has_housing_loan" IS '持家場合-住宅ローン有無';
COMMENT ON COLUMN "users"."industry" IS '業種';
COMMENT ON COLUMN "users"."occupation" IS '職業';
COMMENT ON COLUMN "users"."annual_income" IS '年収';
COMMENT ON COLUMN "users"."current_saving" IS '現在貯蓄額';
COMMENT ON COLUMN "users"."reserve_amount" IS '積立金額';
COMMENT ON COLUMN "users"."created_at" IS '作成日付';
COMMENT ON COLUMN "users"."updated_at" IS '更新日付';
COMMENT ON TABLE "users" IS 'ユーザー';

CREATE TABLE "spouses" (
  "user_id" varchar(16) NOT NULL,
  "age" integer NOT NULL,
  "gender" integer NOT NULL,
  "occupation" integer NOT NULL,
  "annual_income" numeric(10,2) NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "spouses_pk" PRIMARY KEY ("user_id")
);
COMMENT ON COLUMN "spouses"."user_id" IS 'ユーザーID';
COMMENT ON COLUMN "spouses"."age" IS '年齢';
COMMENT ON COLUMN "spouses"."gender" IS '性別';
COMMENT ON COLUMN "spouses"."occupation" IS '職業';
COMMENT ON COLUMN "spouses"."annual_income" IS '年収';
COMMENT ON COLUMN "spouses"."created_at" IS '作成日付';
COMMENT ON COLUMN "spouses"."updated_at" IS '更新日付';
COMMENT ON TABLE "spouses" IS '配偶者';

CREATE TABLE "children" (
  "user_id" varchar(16) NOT NULL,
  "age" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON COLUMN "children"."user_id" IS 'ユーザーID';
COMMENT ON COLUMN "children"."age" IS '年齢';
COMMENT ON COLUMN "children"."created_at" IS '作成日付';
COMMENT ON COLUMN "children"."updated_at" IS '更新日付';
COMMENT ON TABLE "children" IS '子供';

CREATE TABLE "cohabitants" (
  "user_id" varchar(16) NOT NULL,
  "relationship" integer NOT NULL,
  "age" integer NOT NULL,
  "gender" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON COLUMN "cohabitants"."user_id" IS 'ユーザーID';
COMMENT ON COLUMN "cohabitants"."relationship" IS '続柄';
COMMENT ON COLUMN "cohabitants"."age" IS '年齢';
COMMENT ON COLUMN "cohabitants"."gender" IS '性別';
COMMENT ON COLUMN "cohabitants"."created_at" IS '作成日付';
COMMENT ON COLUMN "cohabitants"."updated_at" IS '更新日付';
COMMENT ON TABLE "cohabitants" IS '同居者';

-- あんしんロボアド機能
CREATE TABLE "answers" (
  "user_id" varchar(16) NOT NULL,
  "questionary_id" integer NOT NULL,
  "step" integer NOT NULL,
  "selected" json NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "answers_pk" PRIMARY KEY ("user_id", "questionary_id", "step")
);
COMMENT ON COLUMN "answers"."user_id" IS 'ユーザーID';
COMMENT ON COLUMN "answers"."questionary_id" IS 'アンケートID';
COMMENT ON COLUMN "answers"."step" IS 'ステップ';
COMMENT ON COLUMN "answers"."selected" IS '選択';
COMMENT ON COLUMN "answers"."created_at" IS '作成日付';
COMMENT ON COLUMN "answers"."updated_at" IS '更新日付';
COMMENT ON TABLE "answers" IS '回答';

CREATE TABLE "ai_calc_results" (
  "user_id" varchar(16) NOT NULL,
  "w1" integer NOT NULL,
  "w2" integer NOT NULL,
  "w3" integer NOT NULL,
  "w4" integer NOT NULL,
  "w5" integer NOT NULL,
  "investment_type" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "ai_calc_results_pk" PRIMARY KEY ("user_id")
);
COMMENT ON COLUMN "ai_calc_results"."user_id" IS 'ユーザーID';
COMMENT ON COLUMN "ai_calc_results"."w1" IS '万が一が気になる';
COMMENT ON COLUMN "ai_calc_results"."w2" IS '将来が不安';
COMMENT ON COLUMN "ai_calc_results"."w3" IS '目的がありお金を貯める';
COMMENT ON COLUMN "ai_calc_results"."w4" IS '投資して大きく儲けたい';
COMMENT ON COLUMN "ai_calc_results"."w5" IS '楽しく使いたい';
COMMENT ON COLUMN "ai_calc_results"."investment_type" IS '投資タイプ';
COMMENT ON COLUMN "ai_calc_results"."created_at" IS '作成日付';
COMMENT ON COLUMN "ai_calc_results"."updated_at" IS '更新日付';
COMMENT ON TABLE "ai_calc_results" IS 'AI計算結果';

CREATE TABLE "just_in_case_details" (
  "user_id" varchar(16) NOT NULL,
  "death" integer NOT NULL,
  "cancer" integer NOT NULL,
  "Illness_injury" integer NOT NULL,
  "nursing" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "just_in_case_details_pk" PRIMARY KEY ("user_id")
);
COMMENT ON COLUMN "just_in_case_details"."user_id" IS 'ユーザーID';
COMMENT ON COLUMN "just_in_case_details"."death" IS '死亡';
COMMENT ON COLUMN "just_in_case_details"."cancer" IS 'がん';
COMMENT ON COLUMN "just_in_case_details"."Illness_injury" IS '病気・ケガ';
COMMENT ON COLUMN "just_in_case_details"."nursing" IS '介護';
COMMENT ON COLUMN "just_in_case_details"."created_at" IS '作成日付';
COMMENT ON COLUMN "just_in_case_details"."updated_at" IS '更新日付';
COMMENT ON TABLE "just_in_case_details" IS '万が一詳細';

CREATE TABLE "asset_allocations" (
  "user_id" varchar(16) NOT NULL,
  "recommend_map_id" integer NOT NULL,
  "amount" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "asset_allocations_pk" PRIMARY KEY ("user_id", "recommend_map_id")
);
COMMENT ON COLUMN "asset_allocations"."user_id" IS 'ユーザーID';
COMMENT ON COLUMN "asset_allocations"."recommend_map_id" IS '推薦マップID';
COMMENT ON COLUMN "asset_allocations"."amount" IS '金高';
COMMENT ON COLUMN "asset_allocations"."created_at" IS '作成日付';
COMMENT ON COLUMN "asset_allocations"."updated_at" IS '更新日付';
COMMENT ON TABLE "asset_allocations" IS '資産配分';

-- 管理画面用表
CREATE TABLE "managers" (
  "id" int4 NOT NULL,
  "name" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL,
  "role" integer NOT NULL,
  "status" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "managers_pk" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "managers"."id" IS 'ID';
COMMENT ON COLUMN "managers"."name" IS '名前';
COMMENT ON COLUMN "managers"."password" IS 'パスワード';
COMMENT ON COLUMN "managers"."role" IS '役割';
COMMENT ON COLUMN "managers"."status" IS 'スターテス';
COMMENT ON COLUMN "managers"."created_at" IS '作成日付';
COMMENT ON COLUMN "managers"."updated_at" IS '更新日付';
COMMENT ON TABLE "managers" IS 'マネジャー';

CREATE TABLE "insurance_product_master" (
  "code" integer NOT NULL,
  "name" varchar(255) NOT NULL,
  "link" varchar(255) NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  CONSTRAINT "insurance_product_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "insurance_product_master"."code" IS 'コード';
COMMENT ON COLUMN "insurance_product_master"."name" IS '名称';
COMMENT ON COLUMN "insurance_product_master"."link" IS 'リンク';
COMMENT ON COLUMN "insurance_product_master"."created_at" IS '作成日付';
COMMENT ON COLUMN "insurance_product_master"."updated_at" IS '更新日付';
COMMENT ON TABLE "insurance_product_master" IS '保険商品マスター';

CREATE TABLE "recommend_maps" (
  "id" integer NOT NULL,
  "concept" integer NOT NULL,
  "insurance_class" integer NOT NULL,
  "work_area_type" integer NOT NULL,
  "insurance_product" integer NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "recommend_maps_pk" PRIMARY KEY ("id")
);
COMMENT ON COLUMN "recommend_maps"."id" IS 'ID';
COMMENT ON COLUMN "recommend_maps"."concept" IS '価値観';
COMMENT ON COLUMN "recommend_maps"."insurance_class" IS '保険分類';
COMMENT ON COLUMN "recommend_maps"."work_area_type" IS '職域先タイプ';
COMMENT ON COLUMN "recommend_maps"."insurance_product" IS '保険商品';
COMMENT ON COLUMN "recommend_maps"."created_at" IS '作成日付';
COMMENT ON COLUMN "recommend_maps"."updated_at" IS '更新日付';
COMMENT ON TABLE "recommend_maps" IS '推薦マップ';

-- マスター
CREATE TABLE "concepts_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "concepts_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "concepts_master"."code" IS 'コード';
COMMENT ON COLUMN "concepts_master"."comment" IS 'コメント';
COMMENT ON TABLE "concepts_master" IS '価値観マスター';

CREATE TABLE "gender_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "gender_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "gender_master"."code" IS 'コード';
COMMENT ON COLUMN "gender_master"."comment" IS 'コメント';
COMMENT ON TABLE "gender_master" IS '性別マスター';

CREATE TABLE "industry_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "industry_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "industry_master"."code" IS 'コード';
COMMENT ON COLUMN "industry_master"."comment" IS 'コメント';
COMMENT ON TABLE "industry_master" IS '業種マスター';

CREATE TABLE "insurance_class_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "insurance_class_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "insurance_class_master"."code" IS 'コード';
COMMENT ON COLUMN "insurance_class_master"."comment" IS 'コメント';
COMMENT ON TABLE "insurance_class_master" IS '保険分類マスター';

CREATE TABLE "investment_type_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "investment_type_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "investment_type_master"."code" IS 'コード';
COMMENT ON COLUMN "investment_type_master"."comment" IS 'コメント';
COMMENT ON TABLE "investment_type_master" IS '投資タイプマスター';

CREATE TABLE "occupation_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "occupation_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "occupation_master"."code" IS 'コード';
COMMENT ON COLUMN "occupation_master"."comment" IS 'コメント';
COMMENT ON TABLE "occupation_master" IS '職業マスター';

CREATE TABLE "prefecture_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "prefecture_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "prefecture_master"."code" IS 'コード';
COMMENT ON COLUMN "prefecture_master"."comment" IS 'コメント';
COMMENT ON TABLE "prefecture_master" IS '都道府県';

CREATE TABLE "questionaries" (
  "id" integer NOT NULL,
  "step" integer NOT NULL,
  "question" varchar(255) NOT NULL,
  "options" json NOT NULL,
  CONSTRAINT "questionaries_pk" PRIMARY KEY ("id", "step")
);
COMMENT ON COLUMN "questionaries"."id" IS 'ID';
COMMENT ON COLUMN "questionaries"."step" IS 'ステップ';
COMMENT ON COLUMN "questionaries"."question" IS '質問';
COMMENT ON COLUMN "questionaries"."options" IS 'オプション';
COMMENT ON TABLE "questionaries" IS 'アンケート';

CREATE TABLE "relationship_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "relationship_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "relationship_master"."code" IS 'コード';
COMMENT ON COLUMN "relationship_master"."comment" IS 'コメント';
COMMENT ON TABLE "relationship_master" IS '続柄マスター';

CREATE TABLE "residential_type_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "residential_type_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "residential_type_master"."code" IS 'コード';
COMMENT ON COLUMN "residential_type_master"."comment" IS 'コメント';
COMMENT ON TABLE "residential_type_master" IS '住居形態マスター';

CREATE TABLE "step_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "step_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "step_master"."code" IS 'コード';
COMMENT ON COLUMN "step_master"."comment" IS 'コメント';
COMMENT ON TABLE "step_master" IS 'ステップマスター';

CREATE TABLE "work_area_type_master" (
  "code" integer NOT NULL,
  "comment" varchar(255) NOT NULL,
  CONSTRAINT "work_area_type_master_pk" PRIMARY KEY ("code")
);
COMMENT ON COLUMN "work_area_type_master"."code" IS 'コード';
COMMENT ON COLUMN "work_area_type_master"."comment" IS 'コメント';
COMMENT ON TABLE "work_area_type_master" IS '職域先タイプマスター';

ALTER TABLE "ai_calc_results" ADD CONSTRAINT "ai_calc_results_investment_type_fk" FOREIGN KEY ("investment_type") REFERENCES "investment_type_master" ("code");
ALTER TABLE "ai_calc_results" ADD CONSTRAINT "ai_calc_results_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "answers" ADD CONSTRAINT "answers_step_fk" FOREIGN KEY ("step") REFERENCES "step_master" ("code");
ALTER TABLE "answers" ADD CONSTRAINT "answers_questionary_id_fk" FOREIGN KEY ("questionary_id", "step") REFERENCES "questionaries" ("id", "step");
ALTER TABLE "answers" ADD CONSTRAINT "answers_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "asset_allocations" ADD CONSTRAINT "asset_allocations_recommend_map_id_fk" FOREIGN KEY ("recommend_map_id") REFERENCES "recommend_maps" ("id");
ALTER TABLE "asset_allocations" ADD CONSTRAINT "asset_allocations_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "children" ADD CONSTRAINT "children_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "cohabitants" ADD CONSTRAINT "cohabitants_gender_fk" FOREIGN KEY ("gender") REFERENCES "gender_master" ("code");
ALTER TABLE "cohabitants" ADD CONSTRAINT "cohabitants_relationship_fk" FOREIGN KEY ("relationship") REFERENCES "relationship_master" ("code");
ALTER TABLE "cohabitants" ADD CONSTRAINT "cohabitants_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "just_in_case_details" ADD CONSTRAINT "just_in_case_details_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "questionaries" ADD CONSTRAINT "questionaries_step_fk" FOREIGN KEY ("step") REFERENCES "step_master" ("code");
ALTER TABLE "recommend_maps" ADD CONSTRAINT "recommend_maps_concept_fk" FOREIGN KEY ("concept") REFERENCES "concepts_master" ("code");
ALTER TABLE "recommend_maps" ADD CONSTRAINT "recommend_maps_insurance_class_fk" FOREIGN KEY ("insurance_class") REFERENCES "insurance_class_master" ("code");
ALTER TABLE "recommend_maps" ADD CONSTRAINT "recommend_maps_work_area_type_fk" FOREIGN KEY ("work_area_type") REFERENCES "work_area_type_master" ("code");
ALTER TABLE "recommend_maps" ADD CONSTRAINT "recommend_maps_insurance_product_fk" FOREIGN KEY ("insurance_product") REFERENCES "insurance_product_master" ("code");
ALTER TABLE "spouses" ADD CONSTRAINT "spouses_gender_fk" FOREIGN KEY ("gender") REFERENCES "gender_master" ("code");
ALTER TABLE "spouses" ADD CONSTRAINT "spouses_occupation_fk" FOREIGN KEY ("occupation") REFERENCES "occupation_master" ("code");
ALTER TABLE "spouses" ADD CONSTRAINT "spouses_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "users" ADD CONSTRAINT "users_gender_fk" FOREIGN KEY ("gender") REFERENCES "gender_master" ("code");
ALTER TABLE "users" ADD CONSTRAINT "users_occupation_fk" FOREIGN KEY ("occupation") REFERENCES "occupation_master" ("code");
ALTER TABLE "users" ADD CONSTRAINT "users_industry_fk" FOREIGN KEY ("industry") REFERENCES "industry_master" ("code");
ALTER TABLE "users" ADD CONSTRAINT "users_prefecture_fk" FOREIGN KEY ("prefecture") REFERENCES "prefecture_master" ("code");
ALTER TABLE "users" ADD CONSTRAINT "users_residential_type_fk" FOREIGN KEY ("residential_type") REFERENCES "residential_type_master" ("code");

-- Trigger定義。
-- 行が更新された時に、updated_atに現在時刻を設定します。
CREATE FUNCTION last_updated_at() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        NEW.updated_at := now();
        return NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_spouses_updated_at BEFORE UPDATE ON spouses FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_cohabitants_updated_at BEFORE UPDATE ON cohabitants FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_children_updated_at BEFORE UPDATE ON children FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_answers_updated_at BEFORE UPDATE ON answers FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_ai_calc_results_updated_at BEFORE UPDATE ON ai_calc_results FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_just_in_case_details_updated_at BEFORE UPDATE ON just_in_case_details FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_asset_allocations_updated_at BEFORE UPDATE ON asset_allocations FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_insurance_product_master_updated_at BEFORE UPDATE ON insurance_product_master FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_recommend_maps_updated_at BEFORE UPDATE ON recommend_maps FOR EACH ROW EXECUTE PROCEDURE last_updated_at();
CREATE TRIGGER trg_managers_updated_at BEFORE UPDATE ON managers FOR EACH ROW EXECUTE PROCEDURE last_updated_at();